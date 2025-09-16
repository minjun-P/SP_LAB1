#!/bin/sh
# 사용법: ./run_decomment.sh input.c output.txt

# 인자를 변수로 받기
INPUT="$1"    # 첫 번째 인자 : 숫자

# 인자가 비었을 경우 안내
if [ -z "$INPUT" ] ; then
    echo "Usage: $0 <input.c> <output.txt>"
    exit 1
fi

# 실행: ./test < 입력파일 > 출력파일
./decommenter < "assignment1/test_files/test$INPUT.c" > "assignment1/test_output_files/$INPUT.c"