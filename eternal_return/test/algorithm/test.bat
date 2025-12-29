@echo off
setlocal

REM ===============================
REM 1. MSVC 환경 로드
REM ===============================
call "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat" -arch=x64 || exit /b

REM ===============================
REM 2. 빌드 설정
REM ===============================
set TARGET=graph
set SRC=graph.cpp
set OUT_DIR=build

if not exist %OUT_DIR% mkdir %OUT_DIR%

REM ===============================
REM 3. DLL 빌드
REM ===============================
cl ^
 /std:c++20 ^
 /LD ^
 /DGRAPH_BUILD_DLL ^
 /I. ^
 %SRC% ^
 /Fe:%OUT_DIR%\%TARGET%.dll ^
 /Fo:%OUT_DIR%\ ^
 || exit /b
dumpbin /exports build\graph.dll

REM ===============================
REM 4. Java 컴파일
REM ===============================
del /s /q *.class 2>nul
javac Test.java || exit /b

REM ===============================
REM 5. 실행
REM ===============================
java ^
 --enable-preview ^
 --enable-native-access=ALL-UNNAMED ^
 -Djava.library.path=%OUT_DIR% ^
 Test

endlocal