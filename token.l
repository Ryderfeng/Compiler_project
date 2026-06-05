%{
#include <stdio.h>
#include "grammar.tab.h" 
%}


%option noyywrap

%%

"true"      { return TRUE_VAL; }
"false"     { return FALSE_VAL; }
"AND"       { return AND_OP; }
"OR"        { return OR_OP; }
"NOT"       { return NOT_OP; }
"("         { return LPAREN; }
")"         { return RPAREN; }

\n          { return EOL; }      /* 遇到換行符號，告訴 Bison 一行結束了 */
[ \t]+      { /* 忽略空白 */ }

.           { 
              /* 遇到非法字符，印出警告但繼續執行 */
              printf(" Warning! ignore illegal characters '%s'\n", yytext); 
            }

%%