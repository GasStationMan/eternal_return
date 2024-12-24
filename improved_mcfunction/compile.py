

from command import _command_
from command import _macro_
from command import _macro_token
from lexer import isDigit
from lexer import isIdentification
from lexer import isTargetSelector
from lexer import isOperator
from lexer import isType
from lexer import isOperatorForCompare
from lexer import isBraket
from lexer import SHOW_ERROR_WITH
from lexer import isMCDirectionVector
from lexer import isMcNotDirectionVector




class code_line(_command_):
    def __init__(self):
        #self.node의 값에 따른 타입
        # 1  : 들여쓰기 된 곳 (execute, function, begin)
        # 2  : 재귀 function BACK
        # -1 : 고급 변수 선언 코드 (코드에는 직접적으로 포함되지 않음) ex) score i is #i ER.sys || storage ANIMAL is minecraft:animal animal || entity E is @e[tag=custom]
        self.depth  : int  = 0
        self.data   : str  = ""
        self.node   : int  = 0
        self.tokens : list = []
        self.FUN_Arg :list = []
        self.VARTYPE :int  = 0
        self.isMacro :bool = False
        self.tokenIndex :int  = 0

    def input_not_override(self,array:list):
        if self.depth not in array: array.append(self.depth)

    def setDepthFromLine(self,line):
        self.depth = 0
        for i in range(len(line)):
            if line[i] == " ":
                self.depth += 1
            else:
                break

    def findDepthFromArray(self,array):
        for i in range (len(array)):
            if array[i] == self.depth:
                self.depth = i
                return True
        self.depth = -1
        return False

    def replaceVAR(self,VAR_TABLE:list,index:int) -> bool:
        string = self.tokens[index]
        for row in range(len(VAR_TABLE)):
            TYPE = VAR_TABLE[row][0]
            NAME = VAR_TABLE[row][1]
            LEN_NAME = len(NAME)

            if   TYPE == "storage" and string.startswith(NAME) == True :
                if len(string) == LEN_NAME or string[LEN_NAME:].startswith("[") or string[LEN_NAME:].startswith("."):
                    self.tokens[index] = TYPE + " " + VAR_TABLE[row][3] + " " + VAR_TABLE[row][4] + self.tokens[index][len(NAME):]
                    return True
                
            if   TYPE == "entity" and string.startswith(NAME) == True :
                if len(string) == LEN_NAME:
                    self.tokens[index] = VAR_TABLE[row][3]
                    return True
                elif  string[LEN_NAME:].startswith("["):
                    self.tokens[index] = VAR_TABLE[row][3][0:-1] + "," + self.tokens[index][len(NAME)+1:]
                    return True
            
            elif TYPE == "score" and string == NAME :
                self.tokens[index] = VAR_TABLE[row][3] + " " + VAR_TABLE[row][4]
                return True
            
        return False

    def isVAR(self,VAR_TABLE:list,index:int) -> list:
        ''' 
        :param arg1: self 
        :param arg2: list 
        :param arg3: int 
        :return:     list [VARTYPE, VARNAME, VARENTITY,  VARSCOREBOARD]
        :return:     list [VARTYPE, VARNAME, VARSTORAGE, VARSTORAGENAME]
        :return:     list [VARTYPE, VARNAME, VARENTITY WITH [<EXP>]]
        '''
        string = self.tokens[index]
        for row in range(len(VAR_TABLE)):
            TYPE = VAR_TABLE[row][0]
            NAME = VAR_TABLE[row][1]
            LEN_NAME = len(NAME)
            if   TYPE in ["storage","$storage"] and string.startswith(NAME) == True :
                if len(string) == LEN_NAME or string[LEN_NAME:].startswith(".") or string[LEN_NAME:].startswith("["):
                    return VAR_TABLE[row]
                
            elif TYPE in ["block","$block"]   and string.startswith(NAME) == True :
                if len(string) == LEN_NAME or string[LEN_NAME:].startswith(".") or string[LEN_NAME:].startswith("["):
                    return VAR_TABLE[row]
                
            elif TYPE in ["entity","$entity"]  and string.startswith(NAME) == True :
                if len(string) == LEN_NAME or string[LEN_NAME:].startswith("["):
                    return VAR_TABLE[row]
                
            elif TYPE in ["score","$score","def","$def","import","$import"] and string.startswith(NAME) == True :
                if len(string) == LEN_NAME:
                    return VAR_TABLE[row]
            
        return "NONE"

    def syntaxCheck_test(self,VAR_TABLE,row):
        while self.tokenIndex < len(self.tokens):
            if self.match("execute") : self.execute_command()
            else : return True

    def syntaxCheck(self,VAR_TABLE,row):

        ERROR_STRING = " ".join(self.tokens)
        state = 0
        i = 0
        MAX_LENGTH = len(self.tokens)
        token = ""
        while i < MAX_LENGTH:
            
            token = self.tokens[i]

            if state == 0 :

                if   token == "storage" and self.tokens[i+2] == "is":
                    self.node = -1
                    if MAX_LENGTH == 5 : return True
                    else : False
                elif token == "score"   and self.tokens[i+2] == "is":
                    self.node = -1
                    if MAX_LENGTH == 5 : return True
                    else : False
                elif token == "entity"  and self.tokens[i+2] == "is":
                    self.node = -1
                    if MAX_LENGTH == 4 : return True
                    else : False
                elif token == "def"     and self.tokens[i+2] == "is":
                    self.node = -1
                    if MAX_LENGTH == 4 : return True
                    else : False
                elif token == "import"  and self.tokens[i+2] == "is":
                    self.node = -1
                    if MAX_LENGTH == 4 : return True
                    else : False
                
                                # 0              1                      2 3              4
                # <ENT_VAR_NAME> nbt <ENT_VAR_STORAGE_PATH>   = <ENT_VAR_NAME> nbt   <ENT_VAR_STORAGE_PATH>
                #                                             = <ENT_VAR_NAME> score <ENT_VAR_STORAGE_PATH>
                #                                             = <STORAGE_VAR> || <SCORE_VAR>
                #                                             = <ANY>
                #
                # <ENT_VAR_NAME> score <ENT_VAR_STORAGE_PATH> = <ENT_VAR_NAME> nbt   <ENT_VAR_STORAGE_PATH>
                #                                             = <ENT_VAR_NAME> score <ENT_VAR_STORAGE_PATH>
                #                                             = <STORAGE_VAR> || <SCORE_VAR>
                #                                             = <INT>
                
                var_type = 0

                scoreboard = -1
                player = -2
                
                entity = -1


                VARINFO = self.isVAR(VAR_TABLE,i)
                VARTYPE = VARINFO[0]

                if   VARTYPE == "storage" :
                    self.replaceVAR(VAR_TABLE,i)
                    i += 1
                    if MAX_LENGTH <= i : break
                    token = self.tokens[i]
                    
                    if token == "=" :

                        OPINDEX = i
                        i += 1
                        VARINFO = self.isVAR(VAR_TABLE,i)
                        VARTYPE = VARINFO[0]

                        if   VARTYPE == "storage":
                            self.replaceVAR(VAR_TABLE,i)
                            self.tokens[OPINDEX] = "set from"
                            self.tokens.insert(0,"data modify")
                            return True

                        elif VARTYPE == "score":
                            self.replaceVAR(VAR_TABLE,i)
                            self.tokens[OPINDEX] = "int 1 run scoreboard players get"
                            self.tokens.insert(0,"execute store result")
                            return True
                        
                        elif VARTYPE == "entity":
                            
                            self.replaceVAR(VAR_TABLE,i)
                            i += 1
                            if MAX_LENGTH <= i : break

                            if self.tokens[i] == "score":
                                del self.tokens[i]
                                self.tokens[OPINDEX] = "int 1 run scoreboard players get"
                                self.tokens.insert(0,"execute store result")

                            elif self.tokens[i] == "nbt":
                                del self.tokens[i]
                                self.tokens[OPINDEX] = "set from entity"
                                self.tokens.insert(0,"data modify")
                            
                            else : break

                        else :
                            self.tokens[OPINDEX] = "set value"
                            self.tokens.insert(0,"data modify")
                            return True
                    else : 
                        break
                
                

                elif VARTYPE == "entity" and MAX_LENGTH >= 5:

                    #<Entvar> score <scoreboard>  =     <A>     <B>     <C> 
                    #i        i+1   i+2          i+3    i+4     i+5     i+6     5 ~ 7

                    if self.tokens[i+1] == "score" : 
                        if self.tokens[i+3] == "=":
                            VARINFO_2 = self.isVAR(VAR_TABLE,i+4)
                            if VARINFO_2[var_type] == "score" and MAX_LENGTH == 5 + i :
                                self.data = "scoreboard players operation %s %s = %s %s"%\
                                            (VARINFO[entity],self.tokens[i+2],VARINFO_2[player],VARINFO_2[scoreboard])
                                return True
                            
                            elif VARINFO_2[var_type] == "storage" and MAX_LENGTH >= 5 + i :
                                if MAX_LENGTH == 5 + i  :
                                    self.replaceVAR([VARINFO_2],i+4)
                                    self.data = "execute store result score %s %s run data get %s"%\
                                            (VARINFO[entity],self.tokens[i+2],self.tokens[i+4])
                                    return True
                                elif MAX_LENGTH == 6 + i  and isDigit(self.tokens[i+5]) :
                                    self.replaceVAR([VARINFO_2],i+4)
                                    self.data = "execute store result score %s %s run data get %s %s"%\
                                            (VARINFO[entity],self.tokens[i+2],self.tokens[i+4],self.tokens[i+5])
                                    return True
                                else : break
                            
                            elif VARINFO_2[var_type] == "entity" and MAX_LENGTH >= 7 + i :
                                if self.tokens[i+5] == "score" :
                                    if MAX_LENGTH == 7 + i  :
                                        self.data = "scoreboard players operation %s %s = %s %s"%\
                                                (VARINFO[entity],self.tokens[i+2],VARINFO_2[entity],self.tokens[i+6])
                                    else : break
                                elif self.tokens[i+5] == "nbt"   :
                                    if MAX_LENGTH == 7 + i  :
                                        self.data = "execute store result score %s %s run data get entity %s %s"%\
                                                (VARINFO[entity],self.tokens[i+2],VARINFO_2[entity],self.tokens[i+6])
                                    elif MAX_LENGTH == 8 + i  and isDigit(self.tokes[i+7]):
                                        self.data = "execute store result score %s %s run data get entity %s %s %s"%\
                                                (VARINFO[entity],self.tokens[i+2],VARINFO_2[entity],self.tokens[i+6])
                                    else : break
                                else : break
                            elif isDigit(self.tokens[i+4]) and MAX_LENGTH == 5 + i  :
                                self.data = "scoreboard players set %s %s %s"%\
                                            (VARINFO[entity],self.tokens[i+2],self.tokens[i+4])
                                return True
                            else : break
                            
                        elif self.tokens[i+3] in ["+=","-=","*=","/=","%="]:
                            VARINFO_2 = self.isVAR(VAR_TABLE,i+4)
                            if VARINFO_2[var_type] == "score" and MAX_LENGTH == 5 + i  :
                                self.data = "scoreboard players operation %s %s %s %s %s"%\
                                            (VARINFO[entity],self.tokens[i+2],self.tokens[i+3],VARINFO_2[player],VARINFO_2[scoreboard])
                                return True
                            
                            elif isDigit(self.tokens[i+4]) and MAX_LENGTH == 5 and self.tokens[i+3] in ["*=","/=","%="]:
                                self.data = "scoreboard players set #temp %s\nscoreboard players operation %s %s %s #temp %s"%\
                                            (self.tokens[i+2],VARINFO[entity],self.tokens[i+2],self.tokens[i+3],self.tokens[i+2])
                                return True
                            
                            elif isDigit(self.tokens[i+4]) and MAX_LENGTH == 5 and self.tokens[i+3] == "+=":
                                self.data = "scoreboard players add %s %s %s"%\
                                            (VARINFO[entity],self.tokens[i+2],self.tokens[i+4])
                                return True
                            
                            elif isDigit(self.tokens[i+4]) and MAX_LENGTH == 5 and self.tokens[i+3] == "-=":
                                self.data = "scoreboard players remove %s %s %s"%\
                                            (VARINFO[entity],self.tokens[i+2],self.tokens[i+4])
                                return True
                            
                            else : break
                    
                    elif self.tokens[i+1] == "nbt" :
                        if self.tokens[i+3] == "=":
                            VARINFO_2 = self.isVAR(VAR_TABLE,i+4)
                            if VARINFO_2[0] == "score" and MAX_LENGTH >= 5 + i :
                                if MAX_LENGTH == 5 + i  :
                                    self.data = "execute store result entity %s %s int 1 run scoreboard players get %s %s"%\
                                                (VARINFO[entity],self.tokens[i+2],VARINFO_2[player],VARINFO_2[scoreboard])
                                    return True
                                elif MAX_LENGTH == 6 + i  and isType(self.tokens[i+5]):
                                    self.data = "execute store result entity %s %s %s 1 run scoreboard players get %s %s"%\
                                                (VARINFO[entity],self.tokens[i+2],self.tokens[i+5],VARINFO_2[player],VARINFO_2[scoreboard])
                                    return True
                                elif MAX_LENGTH == 7 + i  and isType(self.tokens[i+5]) and isDigit(self.tokens[i+6]):
                                    self.data = "execute store result entity %s %s %s %s run scoreboard players get %s %s"%\
                                                (VARINFO[entity],self.tokens[i+2],self.tokens[i+5],self.tokens[i+6],VARINFO_2[player],VARINFO_2[scoreboard])
                                    return True
                                else : break
                            
                            elif VARINFO_2[0] == "storage" and MAX_LENGTH == 5 + i  :
                                self.replaceVAR([VARINFO_2],i+4)
                                self.data = "data modify entity %s %s set from %s"%\
                                            (VARINFO[entity],self.tokens[i+2],self.tokens[i+4])
                                return True
                            
                            elif VARINFO_2[0] == "entity" and MAX_LENGTH == 7 + i  :
                                self.data = "data modify entity %s %s set from entity %s %s"%\
                                            (VARINFO[entity],self.tokens[i+2],VARINFO_2[entity],self.tokens[i+6])
                                return True
                            
                            else : 
                                self.data = "data modify entity %s %s set value %s"%\
                                            (VARINFO[entity],self.tokens[i+2],self.tokens[i+4])
                                return True
                        else : break
                    
                    else : break
                                    
                # A B C D E F G       i == 4    len - i = 3 -> 자기 포함 세칸까지 
                # 0 1 2 3 4 5 6       len == 7

                # A C K N O W L E D G E  D      len - i = 4 -> len - i - 1 + i 까지가 최대
                # 0 1 2 3 4 5 6 7 8 9 10 11     len = 12 
                #                 i             i = 8
                elif VARTYPE == "score" and MAX_LENGTH >= 3 + i :
                    if self.tokens[i+1] == "=":
                        VARINFO_2 = self.isVAR(VAR_TABLE,i+2)
                        if VARINFO_2[0] == "score" :
                            self.data = "scoreboard players operation %s %s = %s %s"%\
                                        (VARINFO[player],VARINFO[scoreboard],VARINFO_2[player],VARINFO_2[scoreboard])
                            return True
                            
                        elif VARINFO_2[0] == "storage" :
                            self.replaceVAR([VARINFO_2],i+2)
                            self.data = "execute store result score %s %s run data get %s"%\
                                        (VARINFO[player],VARINFO[scoreboard],self.tokens[i+2])
                            return True
                        
                        elif VARINFO_2[0] == "entity" and MAX_LENGTH >= 5 + i  and self.tokens[i+3] == "nbt":
                            if MAX_LENGTH == 5 + i  :
                                self.data = "execute store result score %s %s run data get entity %s %s"%\
                                            (VARINFO[player],VARINFO[scoreboard],VARINFO_2[entity],self.tokens[i+4])
                                return True
                            elif MAX_LENGTH == 6 + i  and isDigit(self.tokens[i+5]):
                                self.data = "execute store result score %s %s run data get entity %s %s %s"%\
                                            (VARINFO[player],VARINFO[scoreboard],VARINFO_2[scoreboard],self.tokens[i+4],self.tokens[i+5])
                                return True
                        
                        elif VARINFO_2[0] == "entity" and MAX_LENGTH == 5 + i and self.tokens[i+3] == "score":
                            self.data = "scoreboard players operation %s %s %s %s %s"%\
                                        (VARINFO[player],VARINFO[scoreboard],self.tokens[i+1],VARINFO_2[entity],self.tokens[i+4])
                            return True
                        
                        elif isDigit(self.tokens[i+2]):
                            self.data = "scoreboard players set %s %s %s"%\
                                        (VARINFO[player],VARINFO[scoreboard],self.tokens[i+2])
                            return True
                            
                        else : break
                            
                    elif self.tokens[i+1] in ["+=","-=","*=","/=","%="]:
                        VARINFO_2 = self.isVAR(VAR_TABLE,i+2)
                        if VARINFO_2[0] == "score" :
                            self.data = "scoreboard players operation %s %s %s %s %s"%\
                                        (VARINFO[player],VARINFO[scoreboard],self.tokens[i+1],VARINFO_2[player],VARINFO_2[scoreboard])
                            return True
                            
                        elif self.tokens[i+1] in ["*=","/=","%="] and isDigit(self.tokens[i+2]):
                            self.data = "scoreboard players set #temp %s %s\nscoreboard players operation %s %s %s #temp %s"%\
                                        (VARINFO[scoreboard],self.tokens[i+2],VARINFO[player],VARINFO[scoreboard],self.tokens[i+1],VARINFO[scoreboard])
                            return True
                        
                        elif self.tokens[i+1] == "+=" and isDigit(self.tokens[i+2]):
                            self.data = "scoreboard players add %s %s %s"%\
                                        (VARINFO[player],VARINFO[scoreboard],self.tokens[i+2])
                            return True
                            
                        elif self.tokens[i+1] == "-=" and isDigit(self.tokens[i+2]):
                            self.data = "scoreboard players remove %s %s %s"%\
                                        (VARINFO[player],VARINFO[scoreboard],self.tokens[i+2])
                            return True
                        
                        else : break

                

                ### 명령어들 ### 
                elif token == "rotate": return True
                elif token == "return": 
                    i += 1
                    if MAX_LENGTH < i + 1 : break
                    if self.tokens[i] == "run" : state = 0
                    elif isDigit(self.tokens[i]) or self.tokens[i] == "fail" : return True
                    else : break
                elif token == "say"       : return True
                elif token == "scoreboard": state = 1
                elif token == "data"      : state = 2
                elif token == "execute"   : state = 3
                elif token == "tag"       : 
                    i += 1
                    if MAX_LENGTH < i + 1 : break
                    token = self.tokens[i]
                    VARTYPE = self.isVAR(VAR_TABLE,i)[0]
                    TARGETS = isTargetSelector(token)
                    if    VARTYPE == "entity":
                        self.replaceVAR(VAR_TABLE,i)
                        i += 1
                        if MAX_LENGTH < i : break
                    elif  TARGETS == True:  
                        i += 1
                        if MAX_LENGTH < i : break
                    else : break
                    
                    token = self.tokens[i]
                    if   token == "add"    or token == "+=": 
                        self.tokens[i] = "add"
                        return True
                    elif token == "remove" or token == "-=": 
                        self.tokens[i] = "remove"
                        return True
                    elif token == "list"   or token == "*" : 
                        self.tokens[i] = "list"
                        return True
                elif token == "tp"        : 
                    i += 1
                    if MAX_LENGTH < i : break
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : self.replaceVAR(VAR_TABLE,i)
                    return True
                elif token == "kill" or token == "del" :
                    self.tokens[i] = "kill"
                    i += 1
                    if MAX_LENGTH < i : break
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : self.replaceVAR(VAR_TABLE,i)
                    return True
                elif token in ["function","begin","goto"]: state = 5
                #축약된 스코어보드 명령어들
                elif token == "op"      :
                    self.tokens[i] = "scoreboard players operation"
                    #buffer checking
                    if i + 5 != MAX_LENGTH - 1 : break
                    i += 1
                    if MAX_LENGTH < i : break
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : 
                        i += 2
                        if MAX_LENGTH < i : break
                        self.replaceVAR(VAR_TABLE,i)
                    elif isTargetSelector(self.tokens[i])       :   
                        i += 2
                        if MAX_LENGTH < i : break
                    else : break
                      
                    if isOperator(self.tokens[i])               :   i += 1
                    else : break
                    if self.isVAR(VAR_TABLE,i+1)[0] == "entity" : 
                                                                    self.replaceVAR(VAR_TABLE,i)
                                                                    return True
                    elif isTargetSelector(self.tokens[i])       :   return True
                    else : break
                elif token == "add"     :
                    self.tokens[i] = "scoreboard players add"
                    #buffer checking
                    if i + 3 != MAX_LENGTH - 1 : break
                    i += 1
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : 
                                                                    self.replaceVAR(VAR_TABLE,i)
                                                                    i += 2
                    elif isTargetSelector(self.tokens[i])       :   i += 2
                    else : break
                    if isDigit(self.tokens[i])                  : return True
                    else : break
                elif token == "sub"     :
                    self.tokens[i] = "scoreboard players remove"
                    #buffer checking
                    if i + 3 != MAX_LENGTH - 1 : break
                    i += 1
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : 
                                                                    self.replaceVAR(VAR_TABLE,i)
                                                                    return True
                    elif isTargetSelector(self.tokens[i])         : return True
                    else : break                
                elif token == "set"     :
                    self.tokens[i] = "scoreboard players set"
                    if i + 3 != MAX_LENGTH - 1 : break
                    i += 1
                    if self.isVAR(VAR_TABLE,i+1)[0] == "entity"   : 
                                                                    self.replaceVAR(VAR_TABLE,i)
                                                                    return True
                    elif isTargetSelector(self.tokens[i])         : return True
                    else : break
                elif token == "get"     :
                    self.tokens[i] = "scoreboard players get"
                    if i + 2 != MAX_LENGTH - 1 : break
                    i += 1
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : self.replaceVAR(VAR_TABLE,i)
                    elif isTargetSelector(self.tokens[i])         : return True
                    else : break
                    return True
                elif token == "reset"   :
                    self.tokens[i] = "scoreboard players reset"
                    if i + 2 != MAX_LENGTH - 1 : break
                    i += 1
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : self.replaceVAR(VAR_TABLE,i)
                    elif isTargetSelector(self.tokens[i])         : return True
                    else : break
                    return True
                               
                #축약된 execute 명령어들
                elif token == "if"      :
                    self.tokens[i] = "execute if"
                    state = 32
                elif token == "unless"  :
                    self.tokens[i] = "execute unless"
                    state = 32
                else:
                    #print("\033[32m" + "<WARNING>" + "\033[0m" + " 다음 명령어는 컴파일러 내에 포함되지 않았습니다. : \"" + self.tokens[i] + "\" in %s with state = "%(ERROR_STRING) + str(state))
                    return True      
            ## scoreboard syntax : 1xx
            elif state == 1 :
                if   token == "players":
                                          state = 10
                elif token == "objectives":
                                          state = 11
                else : break
                        
            elif state == 10 :
                if   token == "operation"      :
                    #buffer checking
                    if i + 5 != MAX_LENGTH - 1 : break
                    i += 1
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : 
                                                                    i += 2
                                                                    self.replaceVAR(VAR_TABLE,i+1)
                    elif isTargetSelector(self.tokens[i])       :   i += 2
                    else : break
                      
                    if isOperator(self.tokens[i])               :   i += 1
                    else : break
                    if self.isVAR(VAR_TABLE,i+1)[0] == "entity" : 
                                                                    self.replaceVAR(VAR_TABLE,i+3)
                                                                    return True
                    elif isTargetSelector(self.tokens[i])       :   return True
                    else : break
                elif token == "add"     :
                    #buffer checking
                    if i + 3 != MAX_LENGTH - 1 : break
                    i += 1
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : 
                                                                    self.replaceVAR(VAR_TABLE,i+1)
                                                                    i += 2
                    elif isTargetSelector(self.tokens[i])       :   i += 2
                    else : break
                    if isDigit(self.tokens[i])                  : return True
                    else : break
                elif token == "remove"     :
                    #buffer checking
                    if i + 3 != MAX_LENGTH - 1 : break
                    i += 1
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : 
                                                                    self.replaceVAR(VAR_TABLE,i+1)
                                                                    return True
                    elif isTargetSelector(self.tokens[i])         : return True
                    else : break          
                elif token == "set"     :
                    if i + 3 != MAX_LENGTH - 1 : break
                    i += 1
                    if self.isVAR(VAR_TABLE,i+1)[0] == "entity"   : 
                                                                    self.replaceVAR(VAR_TABLE,i+1)
                                                                    return True
                    elif isTargetSelector(self.tokens[i])         : return True
                    else : break
                elif token == "get"     :
                    if i + 2 != MAX_LENGTH - 1 : break
                    i += 1
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : self.replaceVAR(VAR_TABLE,i+1)
                    elif isTargetSelector(self.tokens[i])         : return True
                    else : break
                    return True
                elif token == "reset"     :
                    if i + 2 != MAX_LENGTH - 1 : break
                    i += 1
                    if self.isVAR(VAR_TABLE,i)[0] == "entity"   : self.replaceVAR(VAR_TABLE,i+1)
                    elif isTargetSelector(self.tokens[i])         : return True
                    else : break
                    return True                                 
                else : break
            ## data syntax
            elif state == 2 :
                if   token == "modify"  : state = 20
                elif token == "remove"  : state = 200
                elif token == "get"     : state = 200

            elif state == 20 or state == 200: #modify 이후
                if   token == "entity"  :
                    if   state == 20    : state = 25
                    elif state == 200   : return True #일단 우회
                elif token == "storage" :
                    if   state == 20    : state = 25
                    elif state == 200   : return True #일단 우회
                elif token == "block"   :
                    if   state == 20    : state = 25
                    elif state == 200   : return True #일단 우회
                else :
                    if   state == 20    :
                        if   self.replaceVAR(VAR_TABLE,i) == True : state = 26 #일단 우회
                        else : break

                    elif state == 200   :
                        if   self.replaceVAR(VAR_TABLE,i) == True : return True
                        else : return True
            
            elif state == 25 : 
                i += 1
                state = 26

            elif state == 26 :

                if   token == "set"       : state = 27
                elif token == "append"    : state = 27
                elif token == "prepend"   : state = 27
                elif token == "insert"    : state = 27
                elif token == "merge"     : state = 27
                else : break

            elif state == 27 :
                if   token == "value"     : return True
                elif token == "from"      : state = 200
                elif token == "string"    : state = 200
                else : break
            ## execute syntax
            elif state == 3:  #after execute
                if   token == "as"      : state = 31
                elif token == "at"      : state = 31
                elif token == "if"      : state = 32
                elif token == "unless"  : state = 32
                elif token == "on"      : 
                    i += 1
                    token = self.tokens[i]
                    if   token == "attacker"   : state = 3
                    elif token == "controller" : state = 3
                    elif token == "leasher"    : state = 3
                    elif token == "origin"     : state = 3
                    elif token == "owner"      : state = 3
                    elif token == "passengers" : state = 3
                    elif token == "target"     : state = 3
                    elif token == "vehicle"    : state = 3
                    else : break
                elif token == "store"   : state = 34
                elif token == "summon"  : state = 37
                elif token == "run"     : state = 0
                elif token == "with"    : 
                    self.tokens[i] = "run function"
                    self.tokens.insert(i+1,"with")
                    state = 5
                elif token == ":"       :
                                          self.tokens[i] = "run function"
                                          self.node = 1
                                          return True
                elif token in ["positioned","rotated"] : 
                    if self.tokens[i+1] == "as" and MAX_LENGTH != i + 2:
                        VARINFO = self.isVAR(VAR_TABLE,i+2)
                        if isTargetSelector(self.tokens[i+2]) :
                            i = i + 2
                            state = 3
                        elif VARINFO[0] == "entity":
                            self.replaceVAR([VARINFO],i+2)
                            i = i + 2
                            state = 3
                        else : break
                    elif token == "positioned" :
                        if self.tokens[i+1].startswith("~") or isDigit(self.tokens[i+1]):
                            if self.tokens[i+2].startswith("~") or isDigit(self.tokens[i+2]):
                                if self.tokens[i+3].startswith("~") or isDigit(self.tokens[i+3]):
                                    i += 3
                                    state = 3
                                else : break
                            else : break
                        elif self.tokens[i+1].startswith("^"):
                            if self.tokens[i+2].startswith("^"):
                                if self.tokens[i+3].startswith("^"):
                                    i += 3
                                    state = 3
                                else : break
                            else : break
                        else : break
                    elif token == "rotated" :
                        if self.tokens[i+1].startswith("~") or isDigit(self.tokens[i+1]):
                            if self.tokens[i+2].startswith("~") or isDigit(self.tokens[i+2]):
                                i += 2
                                state = 3
                            else : break
                        else : break
                    else : break
                elif token == "facing":
                        if i + 3 < MAX_LENGTH:
                            if self.tokens[i+1] == "entity" and self.tokens[i+3] in ["feet","eyes"]:
                                VARINFO = self.isVAR(VAR_TABLE,i+2)
                                VARTYPE = VARINFO[0]
                                if VARTYPE == "entity" : 
                                    self.replaceVAR([VARINFO],i+2)
                                    state = 3
                                    i = i + 2 + 1
                                elif isTargetSelector(self.tokens[i+2]) : 
                                    state = 3
                                    i = i + 2 + 1
                                else : break
                            else : break
                        else : break
                else : break
                
            elif state == 31            : 
                if self.isVAR(VAR_TABLE,i)[0] == "entity" :
                    self.replaceVAR(VAR_TABLE,i)
                    state = 3
                    if i + 1 == MAX_LENGTH : return True 
                elif isTargetSelector(token) : 
                    state = 3
                    if i + 1 == MAX_LENGTH : return True
                else : break

            elif state == 32: #after execute if
                if   token == "data"    : state = 36
                elif token == "score"   : state = 33
                elif token == "entity"  : state = 31
                elif token == "function": state = 365
                elif token == "block"   : 
                    if self.tokens[i+1].startswith("~") or isDigit(self.tokens[i+1]):
                            if self.tokens[i+2].startswith("~") or isDigit(self.tokens[i+2]):
                                if self.tokens[i+3].startswith("~") or isDigit(self.tokens[i+3]):
                                    i += 4
                                    state = 3
                                else : break
                            else : break
                    elif self.tokens[i+1].startswith("^"):
                        if self.tokens[i+2].startswith("^"):
                            if self.tokens[i+3].startswith("^"):
                                i += 4
                                state = 3
                            else : break
                        else : break
                    else : break
                elif token == "bossbar" : state = 31 #일단 우회
                else :  
                        i -= 1
                        if i < 0 : break
                        else : state = 33
            
            elif state == 33 or state == 332 : #after execute if <>
                if token == "data" or token == "score" or token == "entity" or token == "block" or token =="bossboar": 
                    break

                VARINFO = self.isVAR(VAR_TABLE,i)
                VARTYPE = VARINFO[0]

                if state == 33 :
                    if self.isVAR(VAR_TABLE,i)[0] == "entity" :       
                        self.replaceVAR(VAR_TABLE,i)
                        state = 331

                    elif self.isVAR(VAR_TABLE,i)[0] == "score" :     
                        self.replaceVAR(VAR_TABLE,i)
                        self.tokens[i] = "score " + self.tokens[i]
                        state = 331

                    else : state = 330
                
                elif state == 332 :
                    if self.isVAR(VAR_TABLE,i)[0] == "entity" :
                        self.replaceVAR(VAR_TABLE,i)
                        i += 1
                        state = 3
                    
                    elif self.isVAR(VAR_TABLE,i)[0] == "score" :
                        self.replaceVAR(VAR_TABLE,i)
                        state = 3

                    else : 
                        i += 1
                        state = 3
            
            elif state == 330 : state = 331
            elif state == 331 :
                if token == "matches" or token == "==":
                    if token == "==" : self.tokens[i] = "matches" 
                    i += 1
                    state = 3
                elif isOperator(token) : state = 332

            elif state == 34 : #execute store
                if   token == "success" :state = 35
                elif token == "result"  :state = 35

            elif state == 35 : #execute store result|success
                if token == "storage" : #execute store result storage <ANYTHING> <ANYTHING> byte|double|float|int|long|short <DIGIT>
                    i += 3
                    token = self.tokens[i]
                    if token == "byte" or token == "double" or token == "float" or token == "int" or token == "long" or token == "short":
                        i += 1
                        state = 3
                        token = self.tokens[i]
                        if isDigit(token) : state = 3
                        else : break
                    else : break
                elif token == "entity"  : #execute store result entity <ANYTHING> <ANYTHING> byte|double|float|int|long|short <DIGIT>
                    i += 3
                    token = self.tokens[i]
                    if token == "byte" or token == "double" or token == "float" or token == "int" or token == "long" or token == "short":
                        i += 1
                        state = 3
                        token = self.tokens[i]
                        if isDigit(token) : state = 3
                        else : break
                    else : break
                elif token == "block"   : #execute store result block ~<DIGIT> ~<DIGIT> ~<DIGIT> <ANYTHING> byte|double|float|int|long|short <DIGIT>
                    i += 4
                    token = self.tokens[i]
                    if token == "byte" or token == "double" or token == "float" or token == "int" or token == "long" or token == "short":
                        i += 1
                        token = self.tokens[i]
                        if isDigit(token) : state = 3
                        else : break
                    else : break
                elif token == "score"   : #execute store result score <TS> <ANYTHING> 
                    i += 1
                    token = self.tokens[i]
                    if isTargetSelector(token):
                        i += 1
                        state = 3
                    else : break
                elif token == "bossbar" : #execute store result bossbar <NAME> MAX|VALUE 
                                        i += 2
                                        state = 3
                elif self.isVAR(VAR_TABLE,i)[0] == "score" : 
                    self.replaceVAR(VAR_TABLE,i)
                    self.tokens[i] = "score " + self.tokens[i]
                    return True                
                elif self.isVAR(VAR_TABLE,i)[0] == "storage" : 
                    self.replaceVAR(VAR_TABLE,i)    
                    return True
                else : break
            
            elif state == 36 : #execute if data
                if   token == "storage" : 
                    i += 2
                    state = 3
                elif token == "entity"  : 
                    i += 2
                    state = 3
                elif token == "block"   : 
                    i += 2
                    state = 3
                else :
                    VARINFO = self.isVAR(VAR_TABLE,i)
                    VARTYPE = VARINFO[0]

                    if   VARTYPE == "storage" : 
                        self.replaceVAR(VAR_TABLE,i)
                        state = 3

                    elif VARTYPE == "entity"  :
                        self.replaceVAR(VAR_TABLE,i)
                        self.tokens[i] = "entity " + self.tokens[i]
                        state = 3
                        i += 1
                    else : break
            
            elif state == 365 : #execute if function
                state = 3

            elif state == 37 : 
                state = 3 #execute summon ...


            elif state == 5  :  #after function
                if   self.tokens[i-1] == "begin": self.tokens[i-1] = "function"
                elif self.tokens[i-1] == "goto": self.tokens[i-1] = "return run function"

                if   token == ":"       :
                    self.tokens.remove(":")
                    self.node = 1
                    return True
                
                elif token.startswith("{") :
                    if self.tokens[-1] == ":" : 
                      del self.tokens[-1]
                      self.node = 1
                    else : 
                      self.node = 0
                
                    self.FUN_Arg = self.tokens[i:]
                    del self.tokens[i:]
                    return True
                                          
                elif token == "BACK"    :
                    del self.tokens[i]
                    self.node = 2
                    return True
                elif token == "with" :
                    i += 1
                    if len(self.tokens) - (i+1) == 1 :
                        if self.replaceVAR(VAR_TABLE,i) == True :
                            self.tokens.remove(":")
                            self.FUN_Arg = self.tokens[-2:]
                            del self.tokens[-2:]
                            self.node = 1
                            return True
                        
                    elif len(self.tokens) - (i+1) == 2 :
                        return True
                    
                    else : break

                else :
                    if MAX_LENGTH == i+1 : 
                        VARINFO = self.isVAR(VAR_TABLE,i)
                        if   VARINFO[0] == "def"    : 
                            self.tokens[i] = "".join(VARINFO[3:]) +"/main"
                        elif VARINFO[0] == "$def"   : 
                            self.tokens[i] = "".join(VARINFO[3:]) +"/main"
                            self.isMacro = True

                        elif VARINFO[0] == "import" : 
                            self.tokens[i] = "".join(VARINFO[3:])
                        elif VARINFO[0] == "$import"   : 
                            self.tokens[i] = "".join(VARINFO[3:])
                            self.isMacro = True

                        return True
                    
                    elif MAX_LENGTH == i+2 : 
                        VARINFO = self.isVAR(VAR_TABLE,i)
                        if   VARINFO[0] == "def"    : 
                            self.tokens[i] = "".join(VARINFO[3:]) +"/main"
                        elif VARINFO[0] == "$def"   : 
                            self.tokens[i] = "".join(VARINFO[3:]) +"/main"
                            self.isMacro = True

                        elif VARINFO[0] == "import" : 
                            self.tokens[i] = "".join(VARINFO[3:])
                        elif VARINFO[0] == "$import"   : 
                            self.tokens[i] = "".join(VARINFO[3:])
                            self.isMacro = True
                        
                        if self.tokens[i+1].startswith("{") : return True

                    elif MAX_LENGTH >= i+3 :  
                        VARINFO = self.isVAR(VAR_TABLE,i)
                        if   VARINFO[0] == "def"    : 
                            self.tokens[i] = "".join(VARINFO[3:]) +"/main"
                        elif VARINFO[0] == "$def"   : 
                            self.tokens[i] = "".join(VARINFO[3:]) +"/main"
                            self.isMacro = True

                        elif VARINFO[0] == "import" : 
                            self.tokens[i] = "".join(VARINFO[3:])
                        elif VARINFO[0] == "$import"   : 
                            self.tokens[i] = "".join(VARINFO[3:])
                            self.isMacro = True
                            
                        if self.tokens[i+1] == "with":
                            VARINFO = self.isVAR(VAR_TABLE,i+2) 
                            if VARINFO[0] == "storage" : self.replaceVAR([VARINFO],i+2)
                        return True
                    else : return False



            else : 
                #print("\033[32m" + "<WARNING>" + "\033[0m" + " 다음 명령어는 컴파일러 내에 포함되지 않았습니다. : \"" + self.tokens[i] + "\" in %s with state = "%(ERROR_STRING) + str(state))
                return True
            
            i += 1

        print("\033[31m" + "<ERROR>" + "\033[0m" + " 줄 %d --> 토큰 \"%s\"의 구성과 감지된 최종 문법 구조가 맞지 않습니다. => %s"%(row + 1,token,ERROR_STRING) + "\n state = %d"%state)
        return False
                   
 
    def callParser(self,VAR_TABLE,row):
        #문법 감지
        if self.syntaxCheck(VAR_TABLE,row): 
            #print ("LINE ACCEPTED " + str(row) + " : " + " ".join(self.tokens))
            return True
        return False
        #self.syntaxCheck(VAR_TABLE)
        
    def writeInFile(self,directory:str,mode:str,codeString:str):
        """
        1번 인자 : 파일 디렉토리
        2번 인자 : 파일 모드 ( "w" || "w+" || "a" || "a+" || "r" || "r+" )
        3번 인자 : 들어갈 내용

        """
        f = open(directory,mode,encoding="UTF-8")
        if self.node == 1:
            f.write(codeString)
        else:
            f.write(codeString + "\n")
        f.close()

    def tokenize(self,line:str) -> bool:
        c = line
        state = 0
        i = 0
        stack = []
        REMOVE = ""
        NONE = ""
        token = ""
        LAST_BRAKET_INDEX = 0
        STATE_NONE        = 0
        STATE_STORE_TOKEN = 1
        FLAG_HAVE_DOLLOR  = 0
        while True:
            
            if state == STATE_NONE :
                if c[i] == "$" and i == 0:
                    self.isMacro = True
                    i += 1
                elif c[i] != " ":
                    state = STATE_STORE_TOKEN
                    continue
                else :
                    i += 1
            
            elif state == STATE_STORE_TOKEN : 
                if len(stack) == 0:
                    if i == len(line) : 
                        if FLAG_HAVE_DOLLOR == 0 and self.isMacro == True : 
                            break
                        
                        elif token != ":" and token.endswith(":") :
                            token = token[:-1]
                            self.tokens.append(token)
                            self.tokens.append(":")
                        
                        elif token != "" : self.tokens.append(token)
                        
                        return True
                    elif   c[i] == " ":
                        if token != NONE : self.tokens.append(token)
                        state = STATE_NONE
                        token = REMOVE
                        continue
                    elif c[i] == "-" or c[i] == "+" or c[i] == "*" or c[i] =="/" or c[i] == "%" or c[i] == "=" or c[i] == ">" or c[i] == "<" :
                        if len(self.tokens) > 0 and self.tokens[-1] == "function" :
                            token += c[i]
                            i += 1
                            continue
                        
                        if token == "~" or token == "^" : 
                            token += c[i]
                            i += 1
                            continue
                            
                        if c[i] == ">" and c[i+1] == "<":
                            token = "><"
                            i += 2
                            continue
                        
                        if i > 1 and c[i-2] == "." and c[i-1] == "." and c[i] == "-":
                            token += c[i]
                            i += 1
                            continue
                            
                        if token != "" : self.tokens.append(token) #이전까지 담던 토큰 append 하기
                        token = c[i]
                        i += 1
                        if c[i] == "=" : 
                            token += c[i]
                            i += 1
                            continue
                        elif c[i-1] == "-":
                            token += c[i]
                            i += 1
                            continue
                        else : continue
                    
                    elif c[i] == "$" :
                        if self.isMacro == False : 
                            FLAG_HAVE_DOLLOR = 1
                            self.isMacro = True
                            token += c[i]
                            i = i + 1
                            continue
                        elif self.isMacro == True:
                            FLAG_HAVE_DOLLOR = 1
                            token += c[i]
                            i = i + 1
                            continue
                    elif c[i] == "[" or c[i] == "{" or  c[i] == "\"" or c[i] == "\'" :
                        LAST_BRAKET_INDEX = i
                        token += c[i]
                        stack.append(c[i])
                        i += 1
                    
                    elif c[i] == "]" or c[i] == "}": break
                    
                    else :
                        token += c[i]
                        i += 1
            
                elif len(stack) > 0 :
                    if i == len(line) : break
                    elif c[i] == "$" :
                        if self.isMacro == False : 
                            FLAG_HAVE_DOLLOR = 1
                            self.isMacro = True
                            token += c[i]
                            i = i + 1
                            continue
                        elif self.isMacro == True:
                            FLAG_HAVE_DOLLOR = 1
                            token += c[i]
                            i = i + 1
                            continue
                    
                    elif c[i] == "\"" and stack[-1] == "\"":
                        LAST_BRAKET_INDEX = i
                        stack.pop()
                        if len(stack) == 0 : 
                            token += c[i]
                            i += 1
                            continue
                        else:
                            token += c[i]
                            i += 1
                    elif c[i] == "\'" and stack[-1] == "\'":
                        LAST_BRAKET_INDEX = i
                        stack.pop()
                        if len(stack) == 0 : 
                            token += c[i]
                            i += 1
                            continue
                        else:
                            token += c[i]
                            i += 1
                    elif c[i] == "[" or c[i] == "{" or  c[i] == "\"" or c[i] == "\'" :
                        
                        token += c[i]
                        if   stack[-1] == "\"" : i += 1
                        elif stack[-1] == "\'" : i += 1
                        else : 
                            LAST_BRAKET_INDEX = i
                            stack.append(c[i])
                            i += 1
                    
                    
                    elif c[i] == "]" or c[i] == "}" or  c[i] == "\"" or c[i] == "\'" :
                        
                        token += c[i]
                        if   stack[-1] == "\"" : i += 1
                        elif stack[-1] == "\'" : i += 1 
                        elif c[i] == "]"  and stack[-1] == "[" :
                            stack.pop()
                            if len(stack) == 0 : 
                                i += 1
                                continue
                            else :
                                i += 1
                        elif c[i] == "}"  and stack[-1] == "{" :
                            stack.pop()
                            if len(stack) == 0 : 
                                i += 1
                                continue
                            else :
                                i += 1
                        else :
                            LAST_BRAKET_INDEX = i 
                            break
                    elif c[i] != "[" and c[i] != "]" and c[i] != "{" and c[i] != "}" and c[i] != "\"" and c[i] != "\'":
                        token += c[i]
                        i += 1
                    
                    else : break
                else : break
            else : break
        print("\033[31m" + "<ERROR>" + "\033[0m " + line[:LAST_BRAKET_INDEX] + " \""+ line[LAST_BRAKET_INDEX] +"\" <=== INVALID BRAKET")
        return False


def main():
    
    code_String = code_line()
    code_String.tokens = "<def> <command> goto -> retrun run function".split()
    while "" in code_String.tokens : code_String.tokens.remove("")

    macro_table : list = []
    macro_table.append(code_String.set_macro())
    currentMacro : _macro_ = macro_table[-1][1]

#while code_String.tokenIndex < len(code_String.tokens):
#    if code_String.match("execute") : code_String.execute_command()
#    else : break



if __name__ == "__main__":
    main()
