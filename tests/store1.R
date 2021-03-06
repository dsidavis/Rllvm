# compile a simple routine that returns an integer
# and takes no arguments.  It returns the value
# we specify here in the code to generate the routine. 

library(Rllvm)
InitializeNativeTarget()

mod = Module("tmp")

fun = Function("foo", Int32Type, module = mod)
entry = Block(fun)
ir = IRBuilder(entry)
iv = ir$createLocalVariable(Int32Type, "i")

one = createIntegerConstant(101L)
ir$createStore( one, iv)

r = ir$createLoad(iv)
ir$createReturn(r) 

showModule(mod)

print(run(fun)) 

