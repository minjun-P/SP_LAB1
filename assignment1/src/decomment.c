#include <stdio.h>
#include <stdlib.h>

/*
    Transition Diagram을 그리라는 과제 디렉션의 취지에 알맞게
    State Driven한 코드를 짜겠다.
*/ 
enum State {
    NORMAL, // 일반적 상황, 그대로 출력
    SLASH_FOUND, // 주석이 될 여지가 있는 상황. 의심 상황
    SINGLE_LINE_COMMENT, // '/'가 연속으로 두번 Detect된 상황
    MULTI_LINE_COMMENT, // '/'이후에 '*'가 Detect된 상황
    NORMAL_IN_CHAR_CONST, // CHAR const로 Wrapping 된 Normal 코드
    NORMAL_IN_STR_CONST // STR const로 Wrapping된 Normal 코드
};


int main(void) {
    int ch;               // 문자 단위 입력을 받을 변수
    FILE *out = stdout;   // 결과를 stdout으로 바로 출력 (또는 파일로 바꿀 수 있음)
    // Decommenter가 처음 시작될 때의 State는 NORMAL로 시작한다.
    enum State state = NORMAL;
    int line_num =1;
    int line_com_start = -1;
    int line_com_count = 0;
    while ((ch = getchar()) != EOF) {   // 표준 입력에서 한 글자씩
        switch (state) {
            case NORMAL:
                switch(ch) {
                    case '/':
                        state = SLASH_FOUND;
                        // 주석이 될 수도 있으니 일단 유보
                        break;
                    case '\'':
                        state = NORMAL_IN_CHAR_CONST;
                        putchar(ch);
                        break;
                    case '\"':
                        state = NORMAL_IN_STR_CONST;
                        putchar(ch);
                        break;
                    default:
                        state = NORMAL;
                        putchar(ch);
                        // 만약 \n이라면 ++
                        if (ch == '\n') {
                            line_num++;
                        }
                        break;
                }
                break;
            case SLASH_FOUND:
                switch(ch) {
                    case '/':
                        state = SINGLE_LINE_COMMENT;
                        break;
                    case '*':
                        state = MULTI_LINE_COMMENT;
                        line_com_start = line_num;
                        break;
                    case '\'':
                        state = NORMAL_IN_CHAR_CONST;
                        putchar(ch);
                    case '\"':
                        state = NORMAL_IN_STR_CONST;
                        putchar(ch);
                        break;
                    default:
                        state = NORMAL;
                        fprintf(out, "/%c", ch);
                        // 만약 \n이라면 ++
                        if (ch == '\n') {
                            line_num++;
                        }
                        break;
                }
                break;
            case SINGLE_LINE_COMMENT:
                if (ch == '\n') {
                    // SINGLE LINE COMMENT 종료 with -> space추가
                    fprintf(out," %c", ch);
                    state = NORMAL;
                    line_num++;
                }
                break;

            case MULTI_LINE_COMMENT:
                switch(ch) {
                    case '\n': {
                        // 개행은 일단 출력하지 말고, Multi line 주석이 끝날 때
                        // 한번에 처리하자.
                        line_num++;
                        // line com은 추후에 주석이 종료될 때를 대비하여 증가시키기
                        line_com_count++;
                        break;
                    }
                    case '*': {
                        int next = getchar();
                        if (next == '/' ) {
                            state = NORMAL;
                            // Multi LINE COMMENT 종료 with -> space추가
                            putchar(' ');
                            // line_com만큼 개행문자 넣어주고 다시 0으로 초기화하기
                            for (int i=0; i<line_com_count; i++) {
                                putchar('\n');
                            }
                            line_com_count = 0;
                        } else {
                            ungetc(next, stdin);
                        }
                        break;
                    }

                }
                break;
            case NORMAL_IN_CHAR_CONST:
                // CHAR CONST 안에 있으면 뭐든 일단 출력
                putchar(ch);
                switch(ch) {
                    case '\\': {
                        int next = getchar(); // 이스케이프 있으면 다음꺼도 뭐가됐든 무조건 출력함, 즉 이 케이스에선 2개 출력
                        putchar(next);
                        break;
                    }
                    case '\'': // CHAR CONST 마주했을 때, NORMAL_IN_CHAR_CONST STATE는 종료
                        state = NORMAL;
                        break;
                }
                break;

            case NORMAL_IN_STR_CONST:
                // STR CONST 안에 있으면 뭐든 일단 출력
                putchar(ch);
                switch(ch) {
                    case '\\': {
                        int next = getchar(); // 이스케이프 있으면 다음꺼도 뭐가됐든 무조건 출력함
                        putchar(next);
                        break;
                    }
                    case '\"': // STR CONST 마주했을 때, NORMAL_IN_STR_CONST 종료
                        state = NORMAL;
                        break;
                }
                break;
        }

    }
     // 여기 도착했으면 EOF 떠서 WHILE 문 끝난 상황
        // 에러 처리 : Unterminated COMMENT
    if (state == MULTI_LINE_COMMENT) {
            fprintf(stderr, "Error: line %d: unterminated comment\n", line_com_start);
            return EXIT_FAILURE;
        }
        return EXIT_FAILURE;
    return EXIT_SUCCESS;
}