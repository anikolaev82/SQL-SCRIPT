select t_distr.c_pattern_code,  t_pattern.*
from Z#PATTERN_DISTR t_distr, Z#PATTERN_DOC t_doc, Z#PATTERN t_pattern, Z#PATTERN t_pattern_rich
where t_distr.id = t_doc.id and t_distr.c_pattern_array = t_pattern.collection_id
and t_distr.c_pattern_code = 'FKD_OP' and t_pattern.c_doc#others = t_pattern_rich.id(+)
