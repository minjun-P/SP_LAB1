#!/bin/sh
# 사용법: ./decomment.sh <번호>
# 예:    ./decomment.sh 0

set -e  # 실행 중 오류가 발생하면 즉시 종료

# ----- 인자 처리 -----
INPUT="$1"    # 첫 번째 인자: 테스트 번호 (예: 0)

if [ -z "$INPUT" ] ; then
    echo "Usage: $0 <test_number>"
    exit 1
fi

# ----- 경로 설정 -----
IN_FILE="assignment1/test_files/test${INPUT}.c"
OUT_DIR="assignment1/reference_output_files"
ERR_DIR="assignment1/reference_error_files"
OUT_FILE="${OUT_DIR}/output${INPUT}.c"
ERR_FILE="${ERR_DIR}/error${INPUT}"

# ----- 디렉토리 준비 -----
mkdir -p "$OUT_DIR" "$ERR_DIR"

# ----- 프로그램 실행 -----
./assignment1/reference/sampledecomment < "$IN_FILE" > "$OUT_FILE" 2> "$ERR_FILE"

echo "✅ 실행 완료"
echo "입력 : $IN_FILE"
echo "출력 : $OUT_FILE"
echo "에러 : $ERR_FILE"
