
## 컴파일러 구현 목표
#
#   LR(1) 로 만들 예정
#   1. LR 파서 제네레이터 제작
#   2. 문법 설계 -> 아마도 pylike로 가지 않을까
#   3. 
#
#
#
#
#
#
#
#

def isMacroVar(string : str):
    return string.startswith("<") and string.endswith(">") and isIdentification(string[1:-1])

def isINT(string):
    i = 0
    dot = False
    while i < len(string):
        c = string[i]
        if len(string) == 1 and '0' <= c and c <= '9' : return True
        elif i == 0         and '1' <= c and c <= '9' : i += 1
        else : return False
    return True

def isMcNotDirectionVector(string):
    return string[0] == '~' and isDigit(string[1:])

def isMCDirectionVector(string):
    return string[0] == '^' and isDigit(string[1:])


def isDigit(string):
    i = 0
    dot = False
    while i < len(string):
        c = string[i]
        if len(string) == 1 and '0' <= c and c <= '9' : return True
        elif i == 0         and '1' <= c and c <= '9' : i += 1
        elif                    '0' <= c and c <= '9' : i += 1
        elif dot == False and c == '.' : 
            dot = True
            i += 1
        else : return False
    return True

def isINT(string):
    i = 0
    dot = False
    while i < len(string):
        c = string[i]
        if len(string) == 1 and '0' <= c and c <= '9' : return True
        elif i == 0         and '1' <= c and c <= '9' : i += 1
        else : return False
    return True

def isIdentification(string):
    i = 0
    while i < len(string):
        c = string[i]
        if   '0' <= c and c <= '9' and i != 0 : i += 1
        elif 'a' <= c and c <= 'z'            : i += 1
        elif 'A' <= c and c <= 'Z'            : i += 1
        elif '_' == c                         : i += 1
        else: return False
    return True

def isTargetSelector(string):
    if string.startswith("#")    :  return True
    elif string.startswith("@")  :  return True
    elif isIdentification(string):  return True

def isOperator(string):
    if string == "=" or string == "+=" or string == "-=" or string == "*=" or string == "/=" or string == "%=" or string == "<"or string == ">" or string == "<>" or string == ">=" or string == "<=" : return True
    else : return False

def isType(string):
    if string == "int" or string == "float" or string == "double" or string == "byte" or string == "long": return True
    else : return False

def isOperatorForCompare(string) :
    if string == "=" or string == "<" or string == ">"or string == ">=" or string == "<=" : return True
    else : return False

def isBraket(string):
    i = 0
    while i < len(string):
        c = string[i]
        if   c == "{" and i == 0              : i += 1
        elif c == "}" and i == len(string) - 1: return True
        else: return False
    return True

def SHOW_ERROR_WITH(index:int,line:str):
    print(line)
    print(" "*(index) + "^")
