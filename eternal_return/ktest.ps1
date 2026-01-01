
$KTLPRJ = "src/main/kotlin/org/EternalReturn/util/physics/geometry"

kotlinc `
  "$KTLPRJ/MatVecCalculator.kt" `
  "$KTLPRJ/Test.kt" `
  -include-runtime `
  -d kout/test.jar

java -jar kout/test.jar