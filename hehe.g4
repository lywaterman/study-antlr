grammar hehe ;

//语法分析
///////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////

//赋值操作符
assignmentOperator : '=' | '+=' | '-=' ;
operatorComparison : 'is' | 'gte' ;
operatorAddSub : '+' | '-' ;

number : Int ;

var : VarName ;

exp : number | 'false' | 'true' | var | exp operatorComparison exp | exp operatorAddSub exp;

varOrExp : var | exp ;

st : set_st | if_st | silently_st | choice_st | select_st | string_st | callFunction;

//字符串表达式，用来显示字符串
string_st : AnyString;

// <<set $toldname = 0>> set表达式用来给变量赋值
set_st : '<<set' var assignmentOperator exp '>>' ;

if_st : '<<if' exp '>>' st* ('<<elseif' exp '>>')* st* ('<<else>>' st*)? '<<endif>>' ;

//choice_st
choice_st : '<<choice' callFunction '>>' ;

//select_st
select_st : choice_st '|' choice_st ;

// <<silently>>  <<endsilently>> 在中间的代码都不会影响显示, 目前只用来赋值
silently_st : Silently set_st* EndSilently ;

// function主要用来显示和跳转
function : FuncDec Label st* ;

//调用函数
callFunction : '[[' Label ']]' | '[[' DelayTime DoFunc ']]' | '[[' AnyString DoFunc ']]' ;

 
//[通话接入], [[launch]], 前一个我们可以认为是调用了一个匿名函数， 函数体是当中的字符串，后一个我们可以任务是调用了,名为launch的函数


//词法分析
FuncDec : '::' ;

Equal : 'is' ;

Minus : '-' ;

Dollar : '$';

OpenSquareBracket:  '[';
CloseSquareBracket: ']';


Assign : '=' ;
PlusAssign : '+=';
MinusAssign : '-=';

DoubleOpenSquareBracket: '[[';
DoubleCloseSquareBracket: ']]';

ShiftLeft:          '<<';

ShiftRight:         '>>';

Label: ('a'..'z' | 'A'..'Z' | '_')  ('a'..'z' | 'A'..'Z' | '0'..'9' | '_')*; //首字母不能是数字

VarName: '$' Label ;

DoFunc: Or Label ;   //在函数体里面如果接受到click时间，那么执行已Label为名字的函数

Or : '|' ;

Gte : 'gte' ;

Set : 'set' ;

Silently : '<<silently>>' ;
EndSilently: '<<endsilently>>' ;

Choice : 'choice' ;

If : 'if' ;

Delay : 'delay' ;

AndAnd : 'and' ;

//数字
fragment
Digit
    : [0-9]
    ;

Time : Int's' | Int 'm' ;

DelayTime : 'delay' Time ;

Int : Digit+ ;

True : 'true' ;

False : 'false' ;

LINE_COMMENT : '//' ('\r\n'|'\r'|'\n'|EOF) -> channel(HIDDEN) ;

AnyString: '"' ~('"')* '"' ; 


WS : [ \t\r\n]+ -> skip ;
