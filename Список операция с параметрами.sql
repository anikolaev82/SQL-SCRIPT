select meth.id, meth.class_id, meth.short_name, meth.name, created, user_created, modified, user_modified, status, result_class_id, flags  type_operation, position, meth_param.short_name, meth_param.name, meth_param.class_id type_return, defval, direction
from methods meth, method_parameters meth_param
where meth.id = meth_param.method_id

