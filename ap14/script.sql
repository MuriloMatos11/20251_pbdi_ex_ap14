-- 1.2

CREATE OR REPLACE FUNCTION fn_bloqueia_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE tb_pessoa
  SET ativo = FALSE
  WHERE cod_pessoa = OLD.cod_pessoa;
  RETURN NULL;
END;
$$;

CREATE TRIGGER tg_bloqueia_delete
BEFORE DELETE ON tb_pessoa
FOR EACH ROW
EXECUTE FUNCTION fn_bloqueia_delete_tb_pessoa();



-- 1.1
ALTER TABLE tb_pessoa
ADD COLUMN ativo BOOLEAN DEFAULT TRUE;