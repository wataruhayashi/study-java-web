-- �f�[�^�x�[�X���쐬
CREATE DATABASE jsp10;

-- SHOW DATABASES���߂Ŋm�F
SHOW DATABASES;

-- �g�p����f�[�^�x�[�X��I��
USE jsp10;

-- �V�K�̃e�[�u�����쐬
CREATE TABLE members (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30), depart VARCHAR(20) DEFAULT '������', age INT, updated DATE);

-- SHOW TABLES���߂Ŋm�F
SHOW TABLES;

-- SHOW FIELDS���߂Ŋm�F
SHOW FIELDS FROM members;
