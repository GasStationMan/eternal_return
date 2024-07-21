
from lexer import isDigit
from lexer import isMacroVar
from lexer import isIdentification
from lexer import isTargetSelector
from lexer import isOperator
from lexer import isType
from lexer import isOperatorForCompare
from lexer import isBraket
from lexer import SHOW_ERROR_WITH
from lexer import isMCDirectionVector
from lexer import isMcNotDirectionVector


class _macro_token():
    def __init__(self,lex,pos):
        self.lex :str = lex 
        self.pos :int = pos

class _macro_():

    """
    <def> <command> print <x> -> tellraw @a [{"storage":"minecraft:<x>","nbt":"<x>"}]
    macro_token = ["print","<x>"] -> macro_token = self.tokens[:index("->")]
    var_token = [
            index_j     values
                0   "<x>"
                ]
    command_token = [
            index_i     values
                0    "tellraw",
                1    "@a",
                2    "[{\"storage\":\"minecraft:",
                3    "<x>",
                4    "\",nbt\":\"",
                5    "<x>",
                6    \"}]\"
                    ] 

    
    macro_token = self.tokens[:index("->")]
    for i in range(len(macro_token)) :
        if isMacroVar(macro_token[i]) var_token.append(macro_token[i]) 
                 
    command_token = self.tokens[index("->") + 1:]                
    
    for i in range(len(var_token)):
        for j in range(len(command_token)): 
            replace_token.append(_macro_token(var_token[index_i],index_j))

    #replace_token = [_macro_token(var_token[0],3),_macro_token(var_token[0],5)]



    """
    def __init__(self):     
        self.var_token     : list = []
        self.macro_token   : list = []
        self.command_token : list = []
        self.replace_token : list = []

class _command_():

    def isEndOfToken(self):
        return (self.tokenIndex == len(self.tokens))

    def readNextToken(self):
        if self.tokenIndex == len(self.tokens) :
            return False
        else : 
            self.tokenIndex += 1
            return True

    def match(self,str):
        if self.tokens[self.tokenIndex] == str or str == "pass": 
            return self.readNextToken()
        return False
    
    def match_s(self,list:list):
        if self.tokens[self.tokenIndex] in list:
            return self.readNextToken()
        return False
    
    def matchTargetSelector(self):
        if isTargetSelector(self.tokens[self.tokenIndex]) :
            return self.readNextToken()
        return False
    
    def matchIdent(self):
        if isIdentification(self.tokens[self.tokenIndex]) :
            return self.readNextToken()
        return False

    def matchIsDigit(self):
        if isDigit(self.tokens[self.tokenIndex]):
            return self.readNextToken()
        return False
    
    def matchVec_Dir(self):
        if isMCDirectionVector(self.tokens[self.tokenIndex]):
            return self.readNextToken()
        return False
    
    def matchVec_Not_Dir(self):
        if isMcNotDirectionVector(self.tokens[self.tokenIndex]):
            return self.readNextToken()
        return False

    def matchMacroVar(self):
        if isMacroVar(self.tokens[self.tokenIndex]):
            return self.readNextToken()
        return False
        
    def err(self,string):
        if self.isEndOfToken() : 
            print("syntaxERR with token \"%s\" : position %d %s"%(self.tokens[self.tokenIndex-1],self.tokenIndex,string))
            print("%s \"%s\"<---"%(" ".join(self.tokens[0:self.tokenIndex]),self.tokens[self.tokenIndex-1]))
        else :
            print("syntaxERR with token \"%s\" : position %d %s"%(self.tokens[self.tokenIndex],self.tokenIndex,string))
            print("%s \"%s\"<---"%(" ".join(self.tokens[0:self.tokenIndex]),self.tokens[self.tokenIndex]))
        return False
    
    
    def isMcVector(self):
        if self.match("~") or self.matchVec_Not_Dir():
            if not (self.match("~") or self.matchVec_Not_Dir()):return False
            if not (self.match("~") or self.matchVec_Not_Dir()):return False
            return True
        elif self.match("^") or self.matchVec_Dir():
            if not (self.match("^") or self.matchVec_Dir()): return False
            if not (self.match("^") or self.matchVec_Dir()): return False
            return True
        elif self.matchIsDigit() :
            if not self.matchIsDigit() : return False
            if not self.matchIsDigit() : return False
            return True
        else : return False

    def execute_command(self):
        if  self.isEndOfToken() : return self.err("")
        if  self.match("as"):
            if not self.matchTargetSelector():                return self.err("")
            return self.execute_command()
        
        elif self.match("at"):
            if not self.matchTargetSelector():                return self.err("")
            return self.execute_command()
        
        elif self.match_s(["if","unless"]):
            if self.match("entity"):
                if not self.matchTargetSelector():            return self.err("")
                return self.execute_command()
                
            elif self.match("block"):
                if self.isMcVector() :
                    return self.execute_command()
                else : return self.err("")
            
            elif self.match("score"):
                if not self.matchTargetSelector()            :return self.err("")
                if not self.match("pass")                    :return self.err("")
                if not self.match_s(["=","<=",">=",">","<"]) :return self.err("")
                if not self.matchTargetSelector()            :return self.err("")
                if not self.match("pass")                    :return self.err("")
                return self.execute_command()
            
            elif self.match("data"):
                if self.match("entity"):
                    if not self.matchTargetSelector()        :return self.err("")
                    if not self.match("pass")                :return self.err("")
                    return self.execute_command()
                
                elif self.match("block"):
                    if self.isMcVector() :
                        if self.match("pass") :
                            return self.execute_command()
                        else : return self.err("")
                    else : return self.err("")
                
                elif self.match("storage"):
                    if not self.match("pass")                    :return self.err("")
                    if not self.match("pass")                    :return self.err("")
                    return self.execute_command()

                else : return self.err("")
            else : return self.err("")
        
        elif self.match("store"):
            if self.match_s(["result","success"]):        
                if self.match("score"):
                    if not self.matchTargetSelector():        return self.err("")
                    if not self.match("pass"):                return self.err("")
                    return self.execute_command()
                        
                elif self.match("entity"):
                    if not self.matchTargetSelector():        return self.err("")
                    if not self.match("pass"):                return self.err("")
                    return self.execute_command()
                
                elif self.match("storage"):
                    if not self.match("pass"):                return self.err("")
                    if not self.match("pass"):                return self.err("")
                    return self.execute_command()
                
                elif self.match("bossbar"):
                    if not self.match("pass"):                return self.err("")
                    if not self.match("pass"):                return self.err("")
                    return self.execute_command()
                
                elif self.match("block"):
                    if self.isMcVector() :
                        if not self.match("pass") :           return self.err("")
                        return self.execute_command()
                    else : return self.err("")
                
                else : return self.err("")

        elif self.match("run") : return True
        else : return self.err("")
    
    def parse_macro(self ,object_ : _macro_ ) -> bool:

        if "->" not in self.tokens : return False

        object_.macro_token = self.tokens[2:self.tokens.index("->")]
        object_.command_token = self.tokens[self.tokens.index("->") + 1:]

        for i in range(len(object_.macro_token)) :
            if isMacroVar(object_.macro_token[i]) : 
                object_.var_token.append(object_.macro_token[i]) 

        for i in range(len(object_.var_token)):
            for j in range(len(object_.command_token)): 
                if object_.var_token[i] == object_.command_token[j] :
                    object_.replace_token.append(_macro_token(object_.var_token[i],j))

        return True

    def set_macro(self) -> list: 

        #<def> <command> storetoEntity <x> = <y> with <data> <scale> -> execute store result entity <x> <data> <scale> run scoreboard players get <y>
        #<def> <entity>  thisEnt -> 
        #<def> <storage> testStr -> minecraft:temp temp
        if  self.isEndOfToken() : return self.err("")
        if  self.match("<def>") :
            if self.match("<command>") : 
                object_ = _macro_()
                if not self.parse_macro(object_) : return self.err("")
                return ["command",object_]
            elif   self.match("<entity>") : 
                if not self.matchIdent()  : return self.err("")
                if not self.match("->")   : return self.err("\"->\"가 누락되었습니다")
                if not self.matchTargetSelector() : return self.err("")
                return ["entity",self.tokens[2],self.tokens[3]]
            elif self.match("<storage>") :
                if not self.match("pass") : return self.err("")
                if not self.match("->")   : return self.err("\"->\"가 누락되었습니다")
                if not self.match("pass") : return self.err("")
                if not self.match("pass") : return self.err("")
                return ["entity",self.tokens[2],self.tokens[3]]


