select 
      t_distr.c_pattern_code
      ,t_distr.c_pattern_name
      ,t_distr.c_post_method
      ,acc_dt.c_cod || ' (' || acc_dt.c_name_acc || ')'
      ,acc_kt.c_cod || ' (' || acc_kt.c_name_acc || ')'
      ,acc_kt.c_method_prod method_prod_kt
      ,acc_dt.c_method_prod method_prod_dt
      ,vid_doc.c_short_name || ' (' || vid_doc.c_name || ')'
      ,type_doc.c_code || ' (' || vid_doc.c_name || ')'
      ,t_rich.c_add
      ,t_rich.c_sum_str
      ,t_pattern.c_union#0
      ,t_pattern.c_exist
from Z#PATTERN_DISTR t_distr
    ,Z#PATTERN_DOC t_doc
    ,Z#PATTERN t_pattern
    ,Z#PATTERN t_pattern_rich
    ,Z#PAT_DOC_RICH t_rich
    ,Z#TIP_ACC acc_dt
    ,Z#TIP_ACC acc_kt
    ,Z#NAME_PAYDOC vid_doc
    ,Z#TYPE_PAYDOC type_doc
where     t_distr.id = t_doc.id
      and t_distr.c_pattern_array = t_pattern.collection_id
      and t_rich.c_acc_dt = acc_dt.id(+)
      and t_rich.c_acc_dt = acc_kt.id(+)
      and t_rich.c_vid_doc = vid_doc.id(+)
      and vid_doc.c_type_doc = type_doc.id(+)
      and t_pattern.c_doc#others = t_pattern_rich.id(+)
      and t_pattern.c_doc#others = t_rich.id(+)
      and t_distr.c_pattern_code = 'CODE_PATTERN_DCO' 
      
     
