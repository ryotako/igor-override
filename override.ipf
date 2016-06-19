#ifndef LOADED_OVERRIDE
#define LOADED_OVERRIDE

Function Override(expr)
	String expr
	Variable buffer=K0
	String lhs="",rhs="",o_expr=""
	String pattern_num="^ *([a-zA-Z][a-zA-Z_0-9]*) *= *([+-]?([0-9]+(\.[0-9]*)?|inf|NaN)) *$"
	String pattern_str="^ *([a-zA-Z][a-zA-Z_0-9]*) *= *([^ ]*) *$"
	if(GrepString(expr,pattern_num))
		SplitString/E=pattern_num expr,lhs,rhs
		Execute/Z "K0="+lhs+"!="+rhs
		if(V_flag || K0)
			o_expr="override constant "+lhs+"="+rhs
		endif
	elseif(GrepString(expr,pattern_str))
		SplitString/E=pattern_str expr,lhs,rhs
		if(!GrepString(rhs,"^\".*\"$"))		
			rhs="\""+rhs+"\""
		endif
		Execute/Z "K0=cmpstr("+lhs+","+rhs+")"
		if(V_flag || K0)
			o_expr="override strconstant "+lhs+"="+rhs
		endif
	endif
	K0=buffer
	if(strlen(o_expr))
		Execute/P "INSERTINCLUDE \"dummy\"\r" + o_expr
		Execute/P "DELETEINCLUDE \"dummy\""
		Execute/P "COMPILEPROCEDURES "
	endif
End
