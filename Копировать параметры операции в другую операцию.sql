--������ ������������ ����������, ������������ ���������

insert into method_parameters (
  METHOD_ID, POSITION, NAME, SHORT_NAME, FLAG,
  CLASS_ID, DEFVAL, DIRECTION, CHANGES, BINDINGS,
  CRIT_FORMULA, CRIT_ID, CRIT_CLASS_ID
  )
  (select
  ( --��� � ��� ������ � ������� ��������� ����� ���������
     select id
     from methods
     where short_name = 'CREATE_CERT_RICH' and class_id = 'CERT_RICHES'
  ), POSITION, NAME, SHORT_NAME, FLAG,
  CLASS_ID, DEFVAL, DIRECTION, CHANGES, BINDINGS,
  CRIT_FORMULA, CRIT_ID, CRIT_CLASS_ID
  from method_parameters
  where method_id = 6887504 --id ������ ��������� �������� ��������
  );
