
import os

def getAnimalFolder(currentDir : str):

    dirList : list = []

    animalList = os.listdir()
    
    for dir in animalList:
        if(os.path.isdir(dir)):
            dirList.append(dir)

    return dirList

def makeFileInFolder(animalList : list , currentDir : str):
    
    for animal in animalList:
        dir : str = currentDir + "\\" + animal + "\\default"
        partList : list[str] = os.listdir(dir)
        
        for part in partList:
            targetDirList : list = currentDir.split("\\")
            targetDirList.pop(-2)

            #item -> items로 바꾸는 작업...
            targetDirList[-1] = targetDirList[-1] + "s"

            #리스트화 된 디렉토리를 다시 합치고, 타겟 디렉토리로 수정
            targetDir : str = "\\".join(targetDirList) + "\\" + animal + "\\default"

            os.makedirs(targetDir, exist_ok= True)
            f = open(targetDir + "\\" + part, "w", encoding="UTF-8")

            #part에서 .json 제거
            listedPartString : list = part.split(".")
            listedPartString.remove("json")
            part = "".join(listedPartString)

            contents = "{\"model\": {\"type\": \"minecraft:model\",\"model\": \"animated_java:item/%s/default/%s\",\"tints\": []}}"%(animal,part)
            print(contents)
            f.write(contents)
            f.close()





def main():
    currentDir = os.getcwd()

    animalList = getAnimalFolder(currentDir)
    makeFileInFolder(animalList, currentDir)




if __name__ == "__main__":
    main()


