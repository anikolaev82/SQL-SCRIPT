select m.id, m.class_id, m.short_name, m.name, c.qualifier, c.control, c.caption, c.tips, c.validate_name, c.class_id, c.top, c.left, c.height, c.tab_index, c.class_id
from METHODS m, CONTROLS c
where m.id = c.meth_id
order by m.class_id, m.short_name
