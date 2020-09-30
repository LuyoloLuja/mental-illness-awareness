create table illnesses(
    id serial not null primary key,
    names text not null
);

INSERT INTO illnesses (id, names) VALUES (1, 'Bipolar');
INSERT INTO illnesses (id, names) VALUES (2, 'Deppression');
INSERT INTO illnesses (id, names) VALUES (3, 'Schizophrania');

create table symptoms (
    id serial NOT NULL PRIMARY KEY,
    description TEXT NOT NULL,
    illness_id int NOT NULL,
    FOREIGN KEY (illness_id) REFERENCES illnesses(id)
);

INSERT INTO symptoms (description, illness_id) VALUES ('Hallucination', 3);
INSERT INTO symptoms (description, illness_id) VALUES ('High or irritated mood', 1);
INSERT INTO symptoms (description, illness_id) VALUES ('Anxiety', 2);
INSERT INTO symptoms (description, illness_id) VALUES ('Easily Distracted', 1);
INSERT INTO symptoms (description, illness_id) VALUES ('Suicidal Thought', 2);
INSERT INTO symptoms (description, illness_id) VALUES ('Delusion', 3);
INSERT INTO symptoms (description, illness_id) VALUES ('More Energy than usual', 1);
INSERT INTO symptoms (description, illness_id) VALUES ('Weight gain or weight loss', 2);
INSERT INTO symptoms (description, illness_id) VALUES ('Agitated', 3);
INSERT INTO symptoms (description, illness_id) VALUES ('Always Feeling Sad', 2);
INSERT INTO symptoms (description, illness_id) VALUES ('Aggression', 3);
INSERT INTO symptoms (description, illness_id) VALUES ('Disorganized thinking', 3);
INSERT INTO symptoms (description, illness_id) VALUES ('Mood Swings', 1);
INSERT INTO symptoms (description, illness_id) VALUES ('Fatigue', 2);
INSERT INTO symptoms (description, illness_id) VALUES ('Rapidly flow speech', 1);
INSERT INTO symptoms (description, illness_id) VALUES ('Memory loss', 3);