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

INSERT INTO symptoms (description, illness_id) VALUES ('Are you having any hallucinations?', 3);
INSERT INTO symptoms (description, illness_id) VALUES ('Do you have high or irritated mood?', 1);
INSERT INTO symptoms (description, illness_id) VALUES ('Do you have anxiety?', 2);
INSERT INTO symptoms (description, illness_id) VALUES ('Are you easily distracted?', 1);
INSERT INTO symptoms (description, illness_id) VALUES ('Do you have suicidal Thought?', 2);
INSERT INTO symptoms (description, illness_id) VALUES ('Do you have delusion?', 3);
INSERT INTO symptoms (description, illness_id) VALUES ('Do you have more Energy than usual?', 1);
INSERT INTO symptoms (description, illness_id) VALUES ('Are you gaining or losing wight?', 2);
INSERT INTO symptoms (description, illness_id) VALUES ('Are you feeling agitated?', 3);
INSERT INTO symptoms (description, illness_id) VALUES ('Are you always feeling Sad?', 2);
INSERT INTO symptoms (description, illness_id) VALUES ('Are you aggresive?', 3);
INSERT INTO symptoms (description, illness_id) VALUES ('Do you have disorganized thinking?', 3);
INSERT INTO symptoms (description, illness_id) VALUES ('Are you having mood Swings?', 1);
INSERT INTO symptoms (description, illness_id) VALUES ('Do have chronic tiredness or sleeplessness?', 2);
INSERT INTO symptoms (description, illness_id) VALUES ('Do you have rapidly flow speech?', 1);
INSERT INTO symptoms (description, illness_id) VALUES ('Do you suffer from memory loss?', 3);

create table peopleNames(
    id serial not null primary key,
    names text not null,
    age TEXT NOT NULL,
    diagnosis INT NOT NUll,

    FOREIGN KEY (diagnosis) REFERENCES illnesses(id)
);