import os
from PIL import Image

#보스바 gui제작을 편하게 하기 위한
#폰트 설정기

#보스바 폰트를 위한 이미지 : BImage 클래스
class BImage():
    def __init__(self, imageFileDirToInput : str, imageFileDirToOutput : str, imageName : str):
        '''BImage 객체를 생성합니다

            @param imageDirectory       : 지정할 이미지 파일의 절대경로입니다. os.getcwd()를 이용하십시오.
            @param imageFileDirToOutput : 내보낼 이미지 파일의 절대경로입니다.
            @param imageName            : 이미지 파일의 확장자 포함 이름입니다.
        '''
        
        imageFileName : list[str] = imageName.split(".")

        self.__xSize : int
        self.__ySize : int
        self.__imageName : str = imageFileName[0] #여기에는 이미지의 이름이 들어가요
        self.__fileType : str = imageFileName[1]  #여기에는 이미지의 확장자가 들어가요
        self.__fullFileName : str = imageName     #여기에는 이미지의 전체 이름 (ex : aaa.jpg)가 들어가요
        self.__imageFileDirToOutput : str = imageFileDirToOutput

        self.__imgFileInput = Image.open(imageFileDirToInput)
        self.__xSize, self.__ySize = self.__imgFileInput.size
    
    def getSize(self) -> int :
        return self.__xSize, self.__ySize
    
    def getSizeX(self) -> int :
        return self.__xSize
    
    def getSizeY(self) -> int :
        return self.__ySize
    
    def getImageName(self) -> str :
        return self.__imageName

    def getFileType(self) -> str :
        return self.__fileType
    
    def getFullFileName(self) -> str :
        return self.__fullFileName
    
    def getImageFileDirToOutput(self) -> str :
        return self.__imageFileDirToOutput    

    
    



    
def toJson(fileName : str) -> str:
    if(fileName.endswith(".")):
        return fileName + "json"
    else:
        return fileName + ".json"

def main():
    traverseAndModify(os.getcwd())
    os.system("pause")
    

#파일 경로 순회하면서 json font파일 생성
def traverseAndModify(location): 

    listDir : list[str] = os.listdir(location)
    
    containImageFolder : bool = False
    for dir in listDir :
        if(dir == "images"):
            containImageFolder = True
            break
    
    #images를 포함하는 폴더인 경우 바로 generateJsonFontFile 실행
    if(containImageFolder):
        print(location)
        generateJsonFontFile(location)
        return

    
    for dir in listDir :

        pathString : str = os.path.join(location,dir)
        
        if(os.path.isdir(pathString)):
            traverseAndModify(pathString)
            


def generateJsonFontFile(currentLocation):

    imageFileDirToInput = currentLocation + "\\images"
    imageFileList : list[str] = os.listdir(imageFileDirToInput)

    bImgList : list[BImage] = []

    #이미지 파일을 읽어와서 보스바 이미지 인스턴스 생성 후 bImgList 리스트에 삽입
    for imageFile in imageFileList :

        #현재 디렉토리\\areas\\...
        directory : str = os.path.join(imageFileDirToInput,imageFile)
        
        #파이썬 파일은 수정하지 않음. & 현재 지정하고 있는 경로가 파일이 아닌 폴더인 경우 continue
        if(imageFile[-2:] == "py" or os.path.isdir(directory)):
            continue
        
        #현재 이 파이썬 파일이 실행되는 경로를 가져옴 -> 이 font파일이 가리킬 이미지 파일의 경로를 구함
        #아직까지는 있는 파일만을 가리키지만, 나중에는 //images 내의 파일을 지정된 경로에 복사하여 붙여넣는
        #기능까지 만들 예정.
        # ...//font//map//default
        dirToPointImgFile : list = currentLocation.split("\\")
        imgFileDir : str = ""

        afterFont = False
        for folderStr in dirToPointImgFile:
            if(folderStr == "font"):
                afterFont = True
                continue
            
            if(afterFont):
                imgFileDir += folderStr + "/"



        bImgList.append(
            BImage(directory, imgFileDir, imageFile))

    #BImage를 순회하면서 해당하는 json파일을 생성한다.
    for bImageFile in bImgList:
        
        #현재 디렉토리\\...
        directory = os.path.join(currentLocation,toJson(bImageFile.getImageName()))

        if(bImageFile.getFileType() == "py" or os.path.isdir(directory)):
            continue

        if(bImageFile.getImageName() == "hyper_loop"):
            convertToJsonFontFile(bImageFile, directory, bImageFile.getImageName(), 800)
        elif(bImageFile.getImageName() == "icon"):
            convertToJsonFontFile(bImageFile, directory, bImageFile.getImageName(), bImageFile.getSizeY() / 2)
        elif(directory.find("hyperloop") != -1):
            convertToJsonFontFile(bImageFile, directory, bImageFile.getImageName(), bImageFile.getSizeY() / 3)
        elif(directory.find("kiosk") != -1):
            convertToJsonFontFile(bImageFile, directory, bImageFile.getImageName(), bImageFile.getSizeY() / 2)



        print("[TDanfung BSwing IconModifier] modifying..." + bImageFile.getImageName())
    
    


def convertToJsonFontFile(bImageFile : BImage, directory : str, fileName : str , imageJsonHeigtValue : int):

    '''.json 확장자의 폰트 파일을 생성하기 위한 함수
    
        @param directory : jsonFile을 내보낼 디렉토리
        @param fileName  : 확장자 없는 순수 파일 이름
        @param imageJsonHeightValue : BImage 클래스에서 .getSizeY()를 호출하여 얻은 값
    '''
    
    f = open(directory,"w")
    
    strList : list[str] = []
    strList.append("{\"providers\":[\n")
    fillJsonFileContents(bImageFile, strList , fileName, imageJsonHeigtValue)
    strList.append("]}")

    for strToInput in strList:
        f.write(strToInput)
    
    f.close()



def fillJsonFileContents(bImageFile : BImage, strList : list[str], fileName : str, imageJsonHeigtValue : int):
    """
    .json 파일에 작성할 내용을 적어 넣는 곳
    """


    iconDir : str = "minecraft:" + bImageFile.getImageFileDirToOutput() + fileName + ".png"
    height : int = 4096
    for i in range(512):
        inputString = "{\"type\": \"bitmap\",\"file\": \""+ iconDir +"\",\"ascent\": "+ str(imageJsonHeigtValue - i) +", \"height\": "+ str(imageJsonHeigtValue) +",\"chars\": [\"\\u" + hex(height + i)[2:] + "\"]}"

        if(i < 511):
            inputString = inputString + ",\n"

        strList.append(inputString)
        #print(inputString)







if __name__ == "__main__":

    main()



