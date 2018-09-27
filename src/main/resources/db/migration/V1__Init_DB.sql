CREATE SEQUENCE hibernate_sequence START 1 INCREMENT 1;

CREATE TABLE message (
  id      INT8 NOT NULL,
  image   BYTEA,
  tag     VARCHAR(255),
  text    VARCHAR(2048) NOT NULL,
  user_id INT8,
  PRIMARY KEY (id)
);

CREATE TABLE user_role (
  user_id INT8 NOT NULL,
  roles   VARCHAR(255)
);

CREATE TABLE usr (
  id       INT8    NOT NULL,
  active   BOOLEAN NOT NULL,
  email    VARCHAR(255),
  password VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE usr_temp (
  id              INT8 NOT NULL,
  activation_code VARCHAR(255),
  email           VARCHAR(255),
  password        VARCHAR(255),
  username        VARCHAR(255),
  PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS message
  ADD CONSTRAINT message_user_fk FOREIGN KEY (user_id) REFERENCES usr;

ALTER TABLE IF EXISTS user_role
  ADD CONSTRAINT user_role__user_fk FOREIGN KEY (user_id) REFERENCES usr;