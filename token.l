%{
#include <stdio.h>
#include "grammar.tab.h" 
%}


%option noyywrap

%%

[tT][rR][uU][eE]|"1"        { return TRUE_VAL; }
[fF][aA][lL][sS][eE]|"0"    { return FALSE_VAL; }
[aA][nN][dD]|"&"            { return AND_OP; }
[oO][rR]|"|"                { return OR_OP; }
[nN][oO][tT]|"!"            { return NOT_OP; }
[xX][oO][rR]|"^"            { return XOR_OP; }
"("                         { return LPAREN; }
")"                         { return RPAREN; }
    
\n                          { return EOL; }      /* 遇到換行符號，告訴 Bison 一行結束了 */
[ \t]+                      { /* 忽略空白 */ }
    
.                           { 
                              /* 遇到非法字符，印出警告但繼續執行 */
                              printf(" Warning! ignore illegal characters '%s'\n", yytext); 
                            }

%%