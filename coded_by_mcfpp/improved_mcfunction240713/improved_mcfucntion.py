

import os
from compile import code_line

def isBlankOnly(codeString):
    for i in range(len(codeString)):
        char = codeString[i]
        if char != " " or char != "\n":
            return False
    return True




def input_not_override(array,value):
    if value not in array:
        array.append(value)


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
    LENGTH = len(mcf_code)
    for i in range(LENGTH):
        line = mcf_code[i].strip()
        if isBlankOnly(line) == False and line.startswith("#") == False:
            BeforeDepth = AfterDepth
            BeforeNode  = AfterNode

            code.append(code_line())
            code[-1].setDepthFromLine(mcf_code[i])
            input_not_override(List_DepthOfCode,code[-1].depth)
            code[-1].findDepthFromArray(List_DepthOfCode)

            ERROR_IS_COMPLETE_BRAKET = code[-1].tokenize(line)
            #print(ERROR_IS_COMPLETE_BRAKET)
            if ERROR_IS_COMPLETE_BRAKET == False : 
                print(" 줄 %d --> 브라켓 또는 매크로 에러 : %s 브라켓 또는 매크로 에러가 tokenize()에 의해 감지되었습니다."%(i+1, line))
                return False
            
            ACCEPT_TO_GENERATE_MCFUNCTION = code[-1].callParser(VAR_TABLE,i)

            AfterDepth = code[-1].depth
            AfterNode  = code[-1].node

            if code[-1].isMacro == True:
                if code[-1].data == "" : code[-1].tokens[0] = "$" + code[-1].tokens[0]
                else : code[-1].data = "$" + code[-1].data

            if code[-1].node == -1: # 변수인 경우 -> 코드엔 직접적으로 포함되지 않으므로 제거
                VAR_TABLE.append(code[-1].tokens)
                code.pop()
                LENGTH -= 1
                
            elif code[-1].node == 1 or code[-1].node == 2:
                code[-1].tokens.append(projectName + ":")
                if code[-1].data == "" : code[-1].data = " ".join(code[-1].tokens)
            
            elif code[-1].node == 0 :
                #print("BeforeDepth = %d AfterDepth = %d"%(BeforeDepth,AfterDepth))
                if BeforeDepth >= AfterDepth and BeforeNode == 1:
                    print("\033[31m" + "<ERROR>" + "\033[0m"" 줄 %d --> 줄바꿈 에러 : 코드블록 내용이 누락되었거나, 직후 코드가 코드블럭 내에 포함되어 있지 않습니다."%(i+1))
                    return 0
                if code[-1].data == "" : code[-1].data = " ".join(code[-1].tokens)
            
            if ACCEPT_TO_GENERATE_MCFUNCTION == False : return 0

    CODE.close()

    List_Dir = current_dir.split("\\")
    del List_Dir[:List_Dir.index("project")]
    mcf_output_dir = os.getcwd() + "\\datapacks\\" + List_Dir[1] + "\\data\\" + List_Dir[1] + "\\functions\\" + "\\".join(List_Dir[2:])

    

    #print(mcf_output_dir)

    #os.makedirs(mcf_output_dir, exist_ok = True)

    #if FILE_NAME == "main":
    #    generate_mcmeta("17","generated_mcfunction",mcf_output_dir)
    
    # MCFUNCTION 파일 생성
    generate_mcfunctions(List_DepthOfCode,code,mcf_output_dir,FILE_NAME)

def generate_mcfunctions(depth,code,mcf_output_dir,FILE_NAME):
    
    LastFileName = []
    # .mcfucntion 제거
    FILE_NAME = FILE_NAME.split(".")[0]
    LastFileName.append((FILE_NAME.split("."))[0])

    FileList = []
    for i in range(len(depth)-1):
        LastFileName.append(-1)

    #List_Dir ...\function\ 이후 가지게 되는 모든 디렉토리 저장
    List_Dir = mcf_output_dir.split("\\")
    del List_Dir[:List_Dir.index("functions") + 1]
    if List_Dir[0] == "" : List_Dir.pop()

    #mcf_output_dir ...\function 까지 나오게 조정
    mcf_output_dir = mcf_output_dir.split("\\")
    del mcf_output_dir[mcf_output_dir.index("functions") + 1:]
    mcf_output_dir = "\\".join(mcf_output_dir) + "\\"


    OutputFunctionDir = ""
    for i in range(len(code)):
        if i == 0: # 인덱스가 0이면 무조건 main 파일에 쓰기
            
            List_Dir.append(FILE_NAME)
            OutputDir = os.path.join(mcf_output_dir + "\\".join(List_Dir))
            OutputName = "main"
            FileList.append(OutputDir + OutputName)
            os.makedirs(OutputDir,exist_ok = True)
            code[i].writeInFile(os.path.join(OutputDir, OutputName) + ".mcfunction","w+",code[i].data)
            
        elif i > 0 and code[i-1].node == 1 and code[i-1].depth < code[i].depth : #execute 또는 function : 콜론 이후 진입 후
            
            #depth 추가에 따라 list에 이름 집어넣기 : branch --> branch/branch...
            LastFileName[code[i].depth] += 1

            #함수 또는 execute ... run function 옆에 붙을 것 들 쓰기
            OutputFunctionArg = " ".join(code[i-1].FUN_Arg)
            OutputFunctionDir = "/".join(List_Dir) + "/" + LastFileName[0] + "/" + str(LastFileName[code[i].depth])
            if OutputFunctionArg == "" : OutputFunctionDir += "\n"
            else                       : OutputFunctionDir += " " + OutputFunctionArg + "\n"
            #정해진 파일에 쓰기
            code[i-1].writeInFile(os.path.join(OutputDir, OutputName + ".mcfunction"),"a+",OutputFunctionDir)

            List_Dir.append(LastFileName[0])
        
        elif i > 0 and code[i-1].node != 1 and code[i-1].depth > code[i].depth : #depth를 통해 execute 또는 function 탈출 감지 
            for j in range(code[i-1].depth - code[i].depth): List_Dir.pop()
            OutputFunctionDir = "/".join(List_Dir) + "/" + str(LastFileName[code[i].depth]) + " " + OutputFunctionArg

        if i > 0: # 파일에 쓰기
            OutputDir = os.path.join(mcf_output_dir, "\\".join(List_Dir))

            if code[i].depth == 0: OutputName = "main"
            else: OutputName = str(LastFileName[code[i].depth])

            #처음 방문 시 -> w+모드 / 그렇지 않으면 a+모드
            if isVisitedFirst(OutputDir + OutputName,FileList) == True:
                
                os.makedirs(OutputDir,exist_ok = True)
                FileList.append(OutputDir + OutputName)

                if code[i].node == 2 :
                    code[i].writeInFile(os.path.join(OutputDir, OutputName + ".mcfunction"),"w+",code[i].data + OutputFunctionDir)
                    #print(code[i].data + OutputFunctionDir)
                else :
                    code[i].writeInFile(os.path.join(OutputDir, OutputName + ".mcfunction"),"w+",code[i].data)
            else:
                if code[i].node == 2 :
                    code[i].writeInFile(os.path.join(OutputDir, OutputName + ".mcfunction"),"a+",code[i].data + OutputFunctionDir)
                    #print(code[i].data + OutputFunctionDir)
                else :
                    code[i].writeInFile(os.path.join(OutputDir, OutputName + ".mcfunction"),"a+",code[i].data)
        
        #for debug
        #print(OutputDir + "\\" + OutputName + "   " + OutputFunctionDir)

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
            traverseForCompile(current_dir + "\\" + FILE_LIST[i],projectName,show_dir)
        elif FILE_LIST[i].endswith(".mcfunction") :
            print("\033[32m" + "COMPILEING..." + "\033[0m ==> " + show_dir + "/" + FILE_LIST[i])
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
            
        
        elif command == "reload":
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
