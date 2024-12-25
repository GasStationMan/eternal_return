

import os
from compile import code_line

def isBlankOnly(codeString):
    for i in range(len(codeString)):
        char = codeString[i]
        if char != " " or char != "\n":
            return False
    return True





def generate_mcmeta(version:int,description:str,output_dir:str):
    os.makedirs(output_dir,exist_ok = True)
    output = open(output_dir + "/" + "pack.mcmeta","w+")
    output.write("{ \n \"pack\": {\n \"pack_format\": %d"%version + ",\"description\": \""+ description +"\"\n}\n}")
    output.close()

def isVisitedFirst(string:str,FileList:list) -> bool:
    """
    string   : 폴더 디렉토리
    FileList : 폴더 디렉토리에 해당하는 파일 또는 폴더 리스트 
              -> 여기서는 폴더의 유무만을 따진다.
    """
    if string in FileList : return False
    else : return True

def getFileMode(OutputDir:str,OutputName:str,FileList:list) -> str:

    if isVisitedFirst(f"{OutputDir}\\{OutputName}",FileList):
        os.makedirs(OutputDir,exist_ok = True)
        FileList.append(f"{OutputDir}\\{OutputName}")
        return "w+"
    else:
        return "a+"

def replaceLinebreak(string : str) -> str:
    i = 0
    length = len(string)
    while(i < length):
        if(string[i] == "\\"):
            if(i + 1 < length and string[i + 1] != "u"): #\u0000 형태인지 확인
                string = string[:i] + " " + string[i+1:]
            elif(i + 1 == length):
                string = string[:i] + " " + string[i+1:]
        i = i + 1
    return string

def compile_to_mcfunction(current_dir,FILE_NAME,projectName):

    #코드 위치 구해서 열기 & 읽기
    CODE_DIR = current_dir + "\\" + FILE_NAME
    CODE = open(CODE_DIR,"r",encoding="UTF-8")
    mcf_code = CODE.readlines()

    #코드의 서로 다른 깊이를 저장
    List_DepthOfCode = []

    #코드 줄 정보 저장
    code = []
    
    #변수 리스트 저장 (바꿔치기?)
    VAR_TABLE = []

    BeforeDepth = 0
    AfterDepth  = 0

    BeforeNode = 0
    AfterNode  = 0

    #> 코드 읽기 + 양 쪽 공백 제거 + 오류 판단

    state = 0
    getLineBreaked = 1
    lineBreaked_line : str = ""
    empty_string     : str = ""

    LENGTH = len(mcf_code)

    #def strCatWithLB

    for i in range(len(mcf_code)):
        if mcf_code[i].endswith("\\\n") :
            if state == 0:
                lineBreaked_line = mcf_code[i].replace("\\\n"," ")
                state = getLineBreaked
                mcf_code[i] = ""
                continue
            if state == getLineBreaked :
                lineBreaked_line += replaceLinebreak(mcf_code[i].strip())
                mcf_code[i] = ""
                continue

        if lineBreaked_line != empty_string : 
            mcf_code[i] = lineBreaked_line + mcf_code[i].strip()
            lineBreaked_line = empty_string
        
        state = 0
        
    for i in range(len(mcf_code)):
        line = mcf_code[i].strip()
        if isBlankOnly(line) == False and line.startswith("#") == False:

            BeforeDepth = AfterDepth
            BeforeNode  = AfterNode

            #code.append(code_line())

            codeline = code_line()
            codeline.setDepthFromLine(mcf_code[i])
            codeline.input_not_override(List_DepthOfCode)
            codeline.findDepthFromArray(List_DepthOfCode) 
            if codeline.tokenize(line) == False : 
                print(" 줄 %d --> 브라켓 또는 매크로 에러 : %s 브라켓 또는 매크로 에러가 tokenize()에 의해 감지되었습니다."%(i+1, line))
                return False
            if codeline.callParser(VAR_TABLE,i) == False : 
                return False

            AfterDepth = codeline.depth
            AfterNode  = codeline.node

            if codeline.isMacro == True:
                if codeline.data == "" : codeline.tokens[0] = "$" + codeline.tokens[0]
                else : codeline.data = "$" + codeline.data

            if codeline.node == -1: # 변수인 경우 -> 코드엔 직접적으로 포함되지 않으므로 위로 바로 건너뛰기
                VAR_TABLE.append(codeline.tokens)
                del codeline
                continue
                
            elif codeline.node == 1 or codeline.node == 2:
                codeline.data = f'{" ".join(codeline.tokens)} {projectName}:'
            
            elif codeline.node == 0 :
                if BeforeDepth >= AfterDepth and BeforeNode == 1:
                    print("\033[31m" + "<ERROR>" + "\033[0m"" 줄 %d --> 줄바꿈 에러 : 코드블록 내용이 누락되었거나, 직후 코드가 코드블럭 내에 포함되어 있지 않습니다."%(i+1))
                    return 0
                if codeline.data == "" : codeline.data = " ".join(codeline.tokens)
            
            
            code.append(codeline)

    CODE.close()

    List_Dir = current_dir.split("\\")
    del List_Dir[:List_Dir.index("project")]
    mcf_output_dir = f'{os.getcwd()}\\datapacks\\{List_Dir[1]}\\data\\{List_Dir[1]}\\functions\\{"/".join(List_Dir[2:])}'

    

    #print(mcf_output_dir)

    #os.makedirs(mcf_output_dir, exist_ok = True)

    #if FILE_NAME == "main":
    #    generate_mcmeta("17","generated_mcfunction",mcf_output_dir)
    
    # MCFUNCTION 파일 생성
    generate_mcfunctions(List_DepthOfCode,code,mcf_output_dir,FILE_NAME)

def generate_mcfunctions(depth,code,mcf_output_dir,FILE_NAME):
    
    # .mcfucntion 제거
    LastFileName : list = [FILE_NAME[0:FILE_NAME.index(".")]] + [0 for i in range(0,len(depth)-1)]
    FileList     : list = []
    List_Dir     : list = []

    OutputFunctionArg = []

    bs0 = "/"
    bs1 = "\\"
    LB  = "\n"
    #List_Dir ...\function\ 이후 가지게 되는 모든 디렉토리 저장

    AfterFuncDirectory = mcf_output_dir[mcf_output_dir.index("functions\\") + len("functions\\"):]

    if AfterFuncDirectory != "":
        LastFileName[0] = f'{AfterFuncDirectory}{bs1}{LastFileName[0]}'


    #mcf_output_dir ...\function 까지 나오게 조정
    mcf_output_dir = mcf_output_dir.split("\\")
    del mcf_output_dir[mcf_output_dir.index("functions") + 1:]
    mcf_output_dir = "\\".join(mcf_output_dir) + "\\"

    OutputFunctionDir = ""
    for i in range(len(code)):
        current_code : code_line = code[i]
        if i > 0 :
            before__code : code_line = code[i-1]
            if before__code.node == 1 :
                if before__code.depth < current_code.depth : #execute 또는 function : 콜론 이후 진입 후
                    #depth 추가에 따라 list에 이름 집어넣기 : branch --> branch/branch...
                    LastFileName[current_code.depth] += 1
                    List_Dir.append(f"b{LastFileName[current_code.depth]}")

                    #함수 인자 스택에 저장
                    if len(before__code.FUN_Arg) != 0 :
                        OutputFunctionArg.append(" ".join(before__code.FUN_Arg))
                        OutputFunctionDir = f'{bs0.join(LastFileName[0].split(bs1))}{bs0}{bs0.join(List_Dir)}{bs0}code {OutputFunctionArg[-1]}{LB}'
                    else :
                        OutputFunctionArg.append("")
                        OutputFunctionDir = f'{bs0.join(LastFileName[0].split(bs1))}{bs0}{bs0.join(List_Dir)}{bs0}code{LB}'
                    
                    #정해진 파일에 쓰기
                    before__code.writeInFile(f"{OutputDir}{bs1}{OutputName}.mcfunction","a+",OutputFunctionDir)
            else :
                if before__code.depth > current_code.depth : #depth를 통해 execute 또는 function 탈출 감지 
                    for j in range(before__code.depth - current_code.depth):
                        OutputFunctionArg.pop()
                        List_Dir.pop()
                if current_code.node == 2 : 
                    OutputFunctionDir = f"{bs0.join(LastFileName[0].split(bs1))}{bs0}{bs0.join(List_Dir)}{bs0}code {OutputFunctionArg[-1]}"
                    current_code.data += OutputFunctionDir
                
        # 파일에 쓰기
        if i == 0 or List_Dir == []: 
            OutputDir = f"{mcf_output_dir}{LastFileName[0]}"
        else :
            OutputDir = f'{mcf_output_dir}{LastFileName[0]}{bs1}{bs1.join(List_Dir)}'
        
        
        if current_code.depth == 0: 
            OutputName = "main"
        else: 
            OutputName = "code"
        
        #처음 방문 시 -> w+모드 / 그렇지 않으면 a+모드
        current_code.writeInFile(f"{OutputDir}{bs1}{OutputName}.mcfunction",getFileMode(OutputDir,OutputName,FileList),current_code.data)
        
def isFileExists(current_dir,FILENAME):
    LIST_FILES = os.listdir(current_dir + "\\project")
    for i in range(len(LIST_FILES)):
        if FILENAME == LIST_FILES[i]:
            return True
    return False

def showFileList(LIST_FILES):
    print(" 프로젝트 내 파일과 폴더들은 다음과 같습니다 : \n\n")
    for i in range(len(LIST_FILES)):
        print("%d.  "%i + LIST_FILES[i])
    print("\n\n")

def traverseForCompile(current_dir:str,projectName:str,show_dir:str):
    FILE_LIST = os.listdir(current_dir)

    for i in range(len(FILE_LIST)):
        if os.path.isdir(current_dir + "\\" + FILE_LIST[i]):
            show_dir = show_dir + "/" + FILE_LIST[i]
            traverseForCompile(f"{current_dir}\\{FILE_LIST[i]}",projectName,show_dir)
        elif FILE_LIST[i].endswith(".mcfunction") :
            print(f"\033[32mCOMPILEING...\033[0m ==> {show_dir}/{FILE_LIST[i]}")
            compile_to_mcfunction(current_dir,FILE_LIST[i],projectName)
        

def deleteDirectory(current_dir:str):
    FILE_LIST = os.listdir(current_dir)

    for i in range(len(FILE_LIST)):

        if os.path.isdir(os.path.join(current_dir,FILE_LIST[i])):

            ### PRINT FOR DEBUG ##
            #print(depth + FILE_LIST[i])
            ### PRINT FOR DEBUG ##

            deleteDirectory(os.path.join(current_dir,FILE_LIST[i]))
            os.rmdir(os.path.join(current_dir,FILE_LIST[i]))

        elif os.path.isfile(os.path.join(current_dir,FILE_LIST[i])) :   

            ### PRINT FOR DEBUG ##
            #print(depth + FILE_LIST[i])
            ### PRINT FOR DEBUG ##

            os.remove(os.path.join(current_dir,FILE_LIST[i]))
            

def main():
    projectName = ""
    current_dir = os.getcwd() + "\\project"
    output_dir  = os.getcwd() + "\\datapacks\\" + projectName + "\\data\\" + projectName + "\\functions"

    print("Improved MCFUNCTION 컴파일러 ver 0.0.1\n명령어를 알고 싶다면 help를 입력해주세요")
    while True:
        
        command = str(input(">>"))

        if command == "help":
            print("1. reload  : 현재 이 코드를 번역합니다.\n"+\
                  "2. setproj : 프로젝트의 이름을 정합니다.\n"+\
                  "3. exit    : 이 프로그램을 종료합니다.")
            
        
        elif command == "reload" or command == "r":
            LIST_FOLDERS = os.listdir(current_dir)
            if projectName in LIST_FOLDERS:
                if os.path.isdir(output_dir):deleteDirectory(output_dir)
                print("========<   COMPILE START  >========")
                traverseForCompile(os.path.join(current_dir,projectName),projectName,projectName)
                print("========< COMPILE COMPLETE >========")
            else:
                print("setproj 로 프로젝트와 파일을 설정해 주십시오")
                
        
        elif command == "setproj":
            print("프로젝트 이름을 입력해 주십시오.")
            LIST_FOLDERS = os.listdir(current_dir)
            showFileList(LIST_FOLDERS)
            
            projectName = str(input("프로젝트 이름>>"))

            if projectName in LIST_FOLDERS:
                print("현재 프로젝트는 " + projectName + " 프로젝트입니다.")
                output_dir  = os.getcwd() + "\\datapacks\\" + projectName + "\\data\\" + projectName + "\\functions"
            else :
                print("존재하지 않는 프로젝트입니다. 폴더를 생성해 주십시오.")
                command = "setproj\n"

        elif command == "exit":
            break

        else :
            print("올바르지 않은 명령어입니다. help를 통해 명령어의 정보를 알아보세요.")


if __name__ == "__main__":
    main()
