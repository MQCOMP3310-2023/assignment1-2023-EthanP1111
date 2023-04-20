/**
 * @name Comp3310 Exercise A.1.13
 * @kind problem
 * @problem.severity warning
 * @id java/example/stacktrace-println
 */

import java

from MethodAccess ma, MethodAccess descendant
where (ma.getMethod().getName() = "printStackTrace" and 
        ma.getMethod().getDeclaringType().hasQualifiedName("java.lang", "Throwable") and
        ma.getNumArgument() = 0) or
      (ma.getMethod().getName() = "println" and 
        ma.getMethod().getDeclaringType().hasQualifiedName("java.io", "PrintStream") and
        descendant.getMethod().getName() = "getMessage" and 
        descendant.getMethod().getDeclaringType().hasQualifiedName("java.lang","Throwable") and
        descendant.getParent() = ma)
        
select ma
