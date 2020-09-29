create table illnesses(
    id serial not null primary key,
    names text not null
);
INSERT INTO illnesses (names) VALUES ('Bipolar');
INSERT INTO illnesses (names) VALUES ('Deppression');
INSERT INTO illnesses (names) VALUES ('Schizophrania');
-------------------------------------------

create table symptom_numbers(
    ID serial primary key,
    illness_id INTEGER NOT null,
    FOREIGN KEY (illness_id) REFERENCES illnesses(id),
    symptom text not null,
    FOREIGN KEY (symptom) REFERENCES symptomps(id)
);


--------------------------------------------
create table symptomps (
    ID serial NOT NULL PRIMARY KEY,
    symptom_name TEXT NOT NULL
);

---------------------------------------------
--  Bipolar
INSERT INTO symptomps (symptom_name) VALUES ('High or irritated mood');
INSERT INTO symptomps (symptom_name) VALUES ('More Energy');
INSERT INTO symptomps (symptom_name) VALUES ('Easily Distracted');

-- Deppression
INSERT INTO symptomps (symptom_name) VALUES ('Anxiety');
INSERT INTO symptomps (symptom_name) VALUES ('Suicidal Thought');
INSERT INTO symptomps (symptom_name) VALUES ('Always Feeling Sad');

INSERT INTO symptomps (symptom_name) VALUES ('Aggression');
INSERT INTO symptomps (symptom_name) VALUES ('Hallucination');
INSERT INTO symptomps (symptom_name) VALUES ('Hallucination');
INSERT INTO symptomps (symptom_name) VALUES ('Agitated');