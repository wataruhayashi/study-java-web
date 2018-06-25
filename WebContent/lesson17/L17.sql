-- jsp10���[�U�[���쐬
GRANT all privileges ON jsp10.* TO jsp10@localhost IDENTIFIED BY 'jsp10';

-- �f�[�^�x�[�X���m�F
SHOW DATABASES; 

-- jsp10�f�[�^�x�[�X�Ɉړ�
USE jsp10;

-- �f�[�^��}��
INSERT INTO members (id, name, depart, age, updated) VALUES (1, '�R�c���Y', '�c�ƕ�', 40, '2014-12-01');

INSERT INTO members (name, age) VALUES ('��؂�����', 25);

INSERT INTO members VALUES (3, '�������Y', '�l����', 35, '2015-01-15');

-- �f�[�^������
SELECT * FROM members ORDER BY id DESC;

-- �f�[�^���X�V
UPDATE members SET depart = '������', updated = '2015-02-02' WHERE id = 2;

-- �f�[�^���폜
DELETE FROM members WHERE id = 3;


-- �y�u�`2�z�e�[�u������f�[�^�����o�� - SELECT����

-- ��ԊȒP��SELECT����
SELECT * FROM members;

-- �������Ń��R�[�h���i�荞��
SELECT name FROM members WHERE id = 1;

-- ������v���������s
SELECT * FROM members WHERE name LIKE '%�R%';

-- �͈͓��̃f�[�^�����o��
SELECT * FROM members WHERE updated BETWEEN '2014-01-01' AND '2014-12-31';

-- �l���X�g�̂����ꂩ�ɍ��v���郌�R�[�h�����o��
SELECT * FROM members WHERE depart IN ('�l����', '������');

-- �����̏�������g�ݍ��킹��
SELECT * FROM members WHERE depart = '������' AND updated IS NULL;
SELECT * FROM members WHERE depart = '������' OR updated IS NULL;

-- �f�[�^����בւ�
SELECT * FROM members ORDER BY age ASC;

-- �f�[�^���W�v
SELECT depart, AVG(age) FROM members GROUP BY depart;

-- �y���K��� 1�z
-- �i1�j
INSERT INTO members (name, depart, age) VALUES ('��؂���', '�c�ƕ�', 22);

-- �i2�j
UPDATE members SET updated = '2015-04-01' WHERE name = '��؂���';

-- �i3�j
DELETE FROM members WHERE name = '��؂���';

-- �y���K��� 2�z
-- �i1�j
SELECT name, depart FROM members WHERE depart IN ('������', '�l����');

-- �i2�j
SELECT depart, MAX(age) FROM members GROUP BY depart;

-- �i3�j
SELECT * FROM members WHERE depart <> '������' AND updated IS NOT NULL ORDER BY updated DESC, id ASC;