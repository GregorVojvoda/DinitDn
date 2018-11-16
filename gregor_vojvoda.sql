
--SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
--SET time_zone = "+00:00";

--To izklopi opcijo za zamenjevanje v primeru da se pojavi znak &
SET SCAN OFF;

select * from auser;

SELECT DBTIMEZONE FROM DUAL;

CREATE TABLE exercise (
  exercise_id   number (11) NOT NULL,
  machine_id    number(11) NOT NULL,
  exercise_name varchar(40) NOT NULL,
  exercise_video  varchar(255) NOT NULL,
  exercise_muscle_group varchar(40) NOT NULL,
  exercise_img varchar(255) NOT NULL,
  --naredimo primary key
  CONSTRAINT exercise_pk PRIMARY KEY ( exercise_id)
);

ALTER TABLE exercise 
ADD CONSTRAINT fk_machine_id
    FOREIGN KEY (machine_id)
    REFERENCES machine(machine_id);


--ENGINE=InnoDB DEFAULT CHARSET=latin1; 
--To ne vem kaj je in ne dela
CREATE TABLE exercise_history (
  exeh_id     NUMBER(11) NOT NULL,
  exercise_id NUMBER(11) NOT NULL,
  user_id     NUMBER(11) NOT NULL,
  exeh_text   VARCHAR(255) NOT NULL,
  exeh_date   VARCHAR(255) NOT NULL,
  CONSTRAINT exeh_pk PRIMARY KEY ( exeh_id)
);

ALTER TABLE exercise_history
ADD CONSTRAINT fk_exercise_id
    FOREIGN KEY (exercise_id)
    REFERENCES exercise(exercise_id);
    
--ENGINE=InnoDB DEFAULT CHARSET=latin1;

drop table machine;

CREATE TABLE machine (
  machine_id NUMBER(11) NOT NULL,
  machine_name VARCHAR(70) NOT NULL,
  machine_img VARCHAR(255) NOT NULL,
  CONSTRAINT machine_pk PRIMARY KEY ( machine_id)
);

--ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE machine_comment (
  com_id        NUMBER(11) NOT NULL,
  user_id       NUMBER(11) NOT NULL,
  machine_id    NUMBER(11) NOT NULL,
  username      VARCHAR(30) NOT NULL,
  comment_text  VARCHAR(255) NOT NULL,
  CONSTRAINT com_pk PRIMARY KEY ( com_id)
);

ALTER TABLE machine_comment 
ADD CONSTRAINT fk_user_id
    FOREIGN KEY (user_id)
    REFERENCES auser(user_id);

ALTER TABLE machine_comment
ADD CONSTRAINT fk_machine_id_2
    FOREIGN KEY (machine_id)
    REFERENCES machine(machine_id);
--ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE auser (
  user_id   NUMBER NOT NULL,
  username  VARCHAR(20) NOT NULL,
  email     VARCHAR(30) NOT NULL,
  pasword   VARCHAR(50) NOT NULL,
  CONSTRAINT user_pk PRIMARY KEY ( user_id)
);

--ENGINE=InnoDB DEFAULT CHARSET=latin1;
--To izklopi opcijo za zamenjevanje v primeru da se pojavi znak &
SET SCAN OFF;

INSERT INTO exercise (exercise_id, machine_id, exercise_name, exercise_video, exercise_muscle_group, exercise_img) VALUES
(1, 1, 'Crunches', 'https://www.youtube.com/embed/ECHNcCsWFsM?&mute=1', 'Trebusne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/crunches.png');
INSERT INTO exercise (exercise_id, machine_id, exercise_name, exercise_video, exercise_muscle_group, exercise_img) VALUES
(2, 2, 'Bench press', 'https://www.youtube.com/embed/--lRBehaaNQ?&mute=1', 'Prsne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/bench_press.png');
INSERT INTO exercise (exercise_id, machine_id, exercise_name, exercise_video, exercise_muscle_group, exercise_img) VALUES
(3, 3, 'Preacher curl', 'https://www.youtube.com/embed/JrXKVeo791g?&mute=1', 'Biceps', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/biceps_curl.png');
(4, 4, 'Seated cable row', 'https://www.youtube.com/embed/tm5Ycj25HNI?&mute=1', 'Hrbne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/seated_cable_row.png')
(5, 5, 'Machine chest fly', 'https://www.youtube.com/embed/Srj4DgZufQ0?&mute=1', 'Prsne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/chest_fly_machine.png'),
(6, 6, 'Machine chest press', 'https://www.youtube.com/embed/xNo51KxebHk?&mute=1', 'Prsne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/chest_press_machine.png'),
(7, 7, 'Machine crunch', 'https://www.youtube.com/embed/CEAZGODFnxY?&mute=1', 'Trebusne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/crunch_machine.png'),
(8, 8, 'Machine dips', 'https://www.youtube.com/embed/-wxhD411ln8?&mute=1', 'Triceps', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/dips_machine.png'),
(9, 9, 'Machine squat', 'https://www.youtube.com/embed/d1RysRiKM2E?&mute=1', 'Nozne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/squat_machine.png'),
(10, 10, 'Machine pull up', 'https://www.youtube.com/embed/watch?v=HUO64GisbDY?&mute=1', 'Stranske hrbtne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/machine_pull_up.png'),
(11, 11, 'Machine lateral reise', 'https://www.youtube.com/embed/1_NSZ-O9rhU?&mute=1', 'Ramenske misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/lateral_reise.png'),
(12, 12, 'Hip abductor', 'https://www.youtube.com/embed/BYokEpAXoDg?&mute=1', 'Ritne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/hip_abductor.png'),
(13, 13, 'Plate loaded back pull down', 'https://www.youtube.com/embed/k5DxMFvCMOg?&mute=1', 'Hrbtne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/back_pull_down.png'),
(14, 14, 'Incline bench press', 'https://www.youtube.com/embed/DJA2UiJl1zI?&mute=1', 'Prsne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/inclined_bench_press.png'),
(15, 15, 'Machine incline chest press', 'https://www.youtube.com/embed/watch?v=on2g6VbZWt0?&mute=1', 'Prsne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/inclined_chest_press.png'),
(18, 10, 'Machine dips', 'https://www.youtube.com/embed/9KzFwtctxl4?&mute=1', 'Triceps', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/dips.png'),
(19, 16, 'Lat pull down ', 'https://www.youtube.com/embed/wOegkuGYHB4?&mute=1', 'Stranske hrbtne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/pull_down.png'),
(20, 17, 'Leg curl', 'https://www.youtube.com/embed/SZhr1OTT4hw?&mute=1', 'Zadnja loza', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/leg_curl.png'),
(21, 18, 'Leg extension', 'https://www.youtube.com/embed/watch?v=jpKiTSsNak8?&mute=1', 'Kvadriceps', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/leg_extension.png'),
(22, 19, 'Leg press', 'https://www.youtube.com/embed/watch?v=g6TJd6v63mA?&mute=1', 'Nozne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/leg_press_machine.png'),
(23, 20, 'Machine leg reise', 'https://www.youtube.com/embed/pTxljhR77QQ?&mute=1', 'Trebusne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/leg_reise.png'),
(24, 21, 'Machine inclined chest press', 'https://www.youtube.com/embed/NEIb5szl5po?&mute=1', 'Prsne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/incline_plateloaded_chest_press.png'),
(25, 22, 'Leg press', 'https://www.youtube.com/embed/watch?v=L8P3nNddhgw?&mute=1', 'Nozne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/leg_press.png'),
(26, 23, 'Seated machine row', 'https://www.youtube.com/embed/nSAUYgIJpf4?&mute=1', 'Hrbtne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/row_machine.png'),
(27, 24, 'Seated machine calves raise', 'https://www.youtube.com/embed/G5yVwJJabVI?&mute=1', 'Listi / meca', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/seated_calf_reise.png'),
(28, 25, 'Seated machine leg curl', 'https://youtu.be/KHaMP0UbyoQ', 'Zadnja loza', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/seated_leg_curl.png'),
(29, 26, 'Machine shoulder press', 'https://youtu.be/aHkEy0TwsGg', 'Ramenske misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/shoulder_press.png'),
(30, 27, 'Smith machine bench press', 'https://youtu.be/aIljXsxGdSs', 'Prsne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/smith_machine_bench_press.png'),
(31, 27, 'Smith machine squat', 'https://youtu.be/aDGvKyzBGw8', 'Nozne misice', 'http://www.studenti.famnit.upr.si/~89141021/exercise_img/smith_machine_squat.png');


INSERT INTO exercise_history (exeh_id, exercise_id, user_id, exeh_text, exeh_date) VALUES
(11, 2, 71, '1 serija: ponovitve: undefined teÅ¾a: undefinedkg <br> 2 serija: ponovitve: undefined teÅ¾a: undefinedkg <br> 3 serija: ponovitve: undefined teÅ¾a: undefinedkg <br><b> Skupno dvijgnjenih: NaNkg </b>', '7/23/2018'),
(12, 9, 77, '1 serija: ponovitve: 16 teÅ¾a: 80kg <br><b> Skupno dvijgnjenih: 1280kg</b>', '7/23/2018'),
(13, 9, 77, '1 serija: ponovitve: 16 teÅ¾a: 80kg <br><b> Skupno dvijgnjenih: 1280kg</b>', '7/23/2018'),
(14, 9, 77, '1 serija: ponovitve: 16 teÅ¾a: 80kg <br><b> Skupno dvijgnjenih: 1280kg</b>', '7/23/2018'),
(15, 9, 77, '1 serija: ponovitve: 16 teÅ¾a: 80kg <br> 2 serija: ponovitve: 11 teÅ¾a: 80kg <br><b> Skupno dvijgnjenih: 2160kg</b>', '7/23/2018'),
(16, 9, 77, '1 serija: ponovitve: 16 teÅ¾a: 80kg <br> 2 serija: ponovitve: 11 teÅ¾a: 80kg <br> 3 serija: ponovitve: 11 teÅ¾a: 80kg <br><b> Skupno dvijgnjenih: 3040kg </b>', '7/23/2018'),
(17, 27, 77, '1 serija: ponovitve: 17 teÅ¾a: 45kg <br><b> Skupno dvijgnjenih: 765kg</b>', '7/23/2018'),
(18, 27, 77, '1 serija: ponovitve: 17 teÅ¾a: 45kg <br> 2 serija: ponovitve: 13 teÅ¾a: 50kg <br><b> Skupno dvijgnjenih: 1415kg</b>', '7/23/2018'),
(19, 27, 77, '1 serija: ponovitve: 17 teÅ¾a: 45kg <br> 2 serija: ponovitve: 13 teÅ¾a: 50kg <br> 3 serija: ponovitve: 11 teÅ¾a: 50kg <br><b> Skupno dvijgnjenih: 1965kg </b>', '7/23/2018'),
(20, 22, 77, '1 serija: ponovitve: 11 teÅ¾a: 100kg <br><b> Skupno dvijgnjenih: 1100kg</b>', '7/23/2018'),
(21, 22, 77, '1 serija: ponovitve: 11 teÅ¾a: 100kg <br> 2 serija: ponovitve: 7 teÅ¾a: 120kg <br><b> Skupno dvijgnjenih: 1940kg</b>', '7/23/2018'),
(22, 8, 77, '1 serija: ponovitve: 12 teÅ¾a: 56kg <br> 2 serija: ponovitve: undefined teÅ¾a: undefinedkg <br> 3 serija: ponovitve: undefined teÅ¾a: undefinedkg <br><b> Skupno dvijgnjenih: NaNkg </b>', '7/23/2018'),
(23, 8, 77, '1 serija: ponovitve: 12 teÅ¾a: 56kg <br> 2 serija: ponovitve: 10 teÅ¾a: 56kg <br> 3 serija: ponovitve: undefined teÅ¾a: undefinedkg <br><b> Skupno dvijgnjenih: NaNkg </b>', '7/23/2018'),
(24, 13, 74, '1 serija: ponovitve: 12 teÅ¾a: 35kg <br> 2 serija: ponovitve: 12 teÅ¾a: 37.5kg <br> 3 serija: ponovitve: 10 teÅ¾a: 37.5kg <br><b> Skupno dvijgnjenih: 1245kg </b>', '7/23/2018'),
(25, 13, 74, '1 serija: ponovitve: 12 teÅ¾a: 35kg <br> 2 serija: ponovitve: 12 teÅ¾a: 37.5kg <br> 3 serija: ponovitve: 10 teÅ¾a: 37.5kg <br><b> Skupno dvijgnjenih: 1245kg </b>', '7/23/2018'),
(26, 26, 74, '1 serija: ponovitve: 12 teÅ¾a: 49kg <br> 2 serija: ponovitve: 12 teÅ¾a: 56kg <br> 3 serija: ponovitve: 12 teÅ¾a: 63kg <br><b> Skupno dvijgnjenih: 2016kg </b>', '7/23/2018'),
(27, 19, 74, '1 serija: ponovitve: 12 teÅ¾a: 57kg <br> 2 serija: ponovitve: 12 teÅ¾a: 70kg <br> 3 serija: ponovitve: 10 teÅ¾a: 77kg <br><b> Skupno dvijgnjenih: 2294kg </b>', '7/23/2018'),
(28, 4, 74, '1 serija: ponovitve: 12 teÅ¾a: 57kg <br> 2 serija: ponovitve: 12 teÅ¾a: 64kg <br> 3 serija: ponovitve: 12 teÅ¾a: 70kg <br><b> Skupno dvijgnjenih: 2292kg </b>', '7/23/2018'),
(29, 3, 74, '1 serija: ponovitve: 12 teÅ¾a: 40kg <br> 2 serija: ponovitve: 12 teÅ¾a: 45kg <br> 3 serija: ponovitve: 10 teÅ¾a: 50kg <br><b> Skupno dvijgnjenih: 1520kg </b>', '7/23/2018'),
(30, 1, 74, '1 serija: ponovitve: 25 teÅ¾a: undefinedkg <br> 2 serija: ponovitve: 25 teÅ¾a: undefinedkg <br> 3 serija: ponovitve: 20 teÅ¾a: undefinedkg <br>4 serija: ponovitve: 20 teÅ¾a: undefinedkg <br><b> Skupno dvijgnjenih: NaNkg </b>', '7/23/2018'),
(31, 2, 70, '1 serija: ponovitve: 12 teÅ¾a: 40kg <br> 2 serija: ponovitve: 8 teÅ¾a: 60kg <br> 3 serija: ponovitve: 5 teÅ¾a: 90kg <br>4 serija: ponovitve: 5 teÅ¾a: 90kg <br>5 serija: ponovitve: 5 teÅ¾a: 95kg <br><b> Skupno dvijgnjenih: 2335kg </b>', '7/24/2018'),
(32, 24, 70, '1 serija: ponovitve: 15 teÅ¾a: 20kg <br> 2 serija: ponovitve: 12 teÅ¾a: 30kg <br> 3 serija: ponovitve: 10 teÅ¾a: 40kg <br>4 serija: ponovitve: 10 teÅ¾a: 40kg <br><b> Skupno dvijgnjenih: 1460kg </b>', '7/24/2018'),
(33, 2, 76, '1 serija: ponovitve: 12 teÅ¾a: 40kg <br><b> Skupno dvijgnjenih: 480kg</b>', '7/27/2018'),
(34, 2, 76, '1 serija: ponovitve: 12 teÅ¾a: 40kg <br> 2 serija: ponovitve: 10 teÅ¾a: 40kg <br><b> Skupno dvijgnjenih: 880kg</b>', '7/27/2018'),
(35, 2, 76, '1 serija: ponovitve: 12 teÅ¾a: 40kg <br> 2 serija: ponovitve: 10 teÅ¾a: 40kg <br> 3 serija: ponovitve: 8 teÅ¾a: 50kg <br><b> Skupno dvijgnjenih: 1280kg </b>', '7/27/2018'),
(36, 25, 76, '1 serija: ponovitve: 15 teÅ¾a: 80kg <br><b> Skupno dvijgnjenih: 1200kg</b>', '7/27/2018'),
(37, 25, 76, '1 serija: ponovitve: 15 teÅ¾a: 80kg <br> 2 serija: ponovitve: 15 teÅ¾a: 90kg <br><b> Skupno dvijgnjenih: 2550kg</b>', '7/27/2018'),
(38, 25, 76, '1 serija: ponovitve: 15 teÅ¾a: 80kg <br> 2 serija: ponovitve: 15 teÅ¾a: 90kg <br> 3 serija: ponovitve: 13 teÅ¾a: 120kg <br><b> Skupno dvijgnjenih: 4110kg </b>', '7/27/2018'),
(39, 9, 76, '1 serija: ponovitve: 18 teÅ¾a: 60kg <br><b> Skupno dvijgnjenih: 1080kg</b>', '7/27/2018'),
(40, 9, 76, '1 serija: ponovitve: 18 teÅ¾a: 60kg <br> 2 serija: ponovitve: 15 teÅ¾a: 70kg <br><b> Skupno dvijgnjenih: 2130kg</b>', '7/27/2018'),
(41, 9, 76, '1 serija: ponovitve: 18 teÅ¾a: 60kg <br> 2 serija: ponovitve: 15 teÅ¾a: 70kg <br> 3 serija: ponovitve: 11 teÅ¾a: 80kg <br><b> Skupno dvijgnjenih: 3010kg </b>', '7/27/2018'),
(42, 27, 76, '1 serija: ponovitve: 35 teÅ¾a: 20kg <br><b> Skupno dvijgnjenih: 700kg</b>', '7/27/2018'),
(43, 27, 76, '1 serija: ponovitve: 35 teÅ¾a: 20kg <br> 2 serija: ponovitve: 45 teÅ¾a: 14kg <br><b> Skupno dvijgnjenih: 1330kg</b>', '7/27/2018'),
(44, 27, 76, '1 serija: ponovitve: 35 teÅ¾a: 20kg <br> 2 serija: ponovitve: 45 teÅ¾a: 14kg <br> 3 serija: ponovitve: 45 teÅ¾a: 9kg <br><b> Skupno dvijgnjenih: 1735kg </b>', '7/27/2018'),
(45, 20, 69, '1 serija: ponovitve: 15 teÅ¾a: 10kg <br> 2 serija: ponovitve: 15 teÅ¾a: 10kg <br> 3 serija: ponovitve: 10 teÅ¾a: 5kg <br>4 serija: ponovitve: 10 teÅ¾a: 5kg <br><b> Skupno dvijgnjenih: 400kg </b>', '8/2/2018'),
(46, 21, 69, '1 serija: ponovitve: 40 teÅ¾a: 15kg <br> 2 serija: ponovitve: 30 teÅ¾a: 25kg <br> 3 serija: ponovitve: 10 teÅ¾a: 35kg <br><b> Skupno dvijgnjenih: 1700kg </b>', '8/2/2018'),
(47, 28, 69, '1 serija: ponovitve: 12 teÅ¾a: 42kg <br> 2 serija: ponovitve: 12 teÅ¾a: 35kg <br> 3 serija: ponovitve: 12 teÅ¾a: 35kg <br><b> Skupno dvijgnjenih: 1344kg </b>', '8/2/2018'),
(48, 2, 80, '1 serija: ponovitve: 15 teÅ¾a: 70kg <br> 2 serija: ponovitve: 12 teÅ¾a: 65kg <br> 3 serija: ponovitve: 10 teÅ¾a: 60kg <br><b> Skupno dvijgnjenih: 2430kg </b>', '11/10/2018');



INSERT INTO machine (machine_id, machine_name, machine_img) VALUES
(1, 'Abs bench', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/abs_bench.JPG');
(2, 'Bench press', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/bench_press.JPG'),
(3, 'Preacher curl machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/biceps_machine.JPG'),
(4, 'Seated cable row machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/cable_row_machine.JPG'),
(5, 'Chest fly machin', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/chest_fly_machine.JPG'),
(6, 'Chest press machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/chest_press.JPG'),
(7, 'Crunch machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/crunch_machine.JPG'),
(8, 'Dips machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/dips_machine.JPG'),
(9, 'Squat machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/squat_machine.JPG'),
(10, 'Pull up machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/pull_up_machine.JPG'),
(11, 'Lateral raise machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/lateral_reise.JPG'),
(12, 'Glutes machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/hip_abductor.JPG'),
(13, 'Plate loaded pull down', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/back_pull_donw.JPG'),
(14, 'Incline bench press', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/incline_bench.JPG'),
(15, 'Inclined chest press mchine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/incline_chest_press.JPG'),
(16, 'Lat pull down machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/lat_pulldown.JPG'),
(17, 'Leg curl', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/leg_curl.JPG'),
(18, 'Leg extension machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/leg_extension.JPG'),
(19, 'Leg press machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/leg_pres.JPG'),
(20, 'Leg reise machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/leg_reise_machine.JPG'),
(21, 'Plate loaded incline chest press machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/plate_loaded_chest_press.JPG'),
(22, 'Plate loaded leg press machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/plate_loaded_legg_press.JPG'),
(23, 'Seated row machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/row_machine.JPG'),
(24, 'Seated calves reise machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/seated_calves.JPG'),
(25, 'Seated leg curl machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/seated_leg_curl.JPG'),
(26, 'Shoulder press machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/shoulder_press.JPG'),
(27, 'Smith machine', 'http://www.studenti.famnit.upr.si/~89141021/machine_img/smith_machine.JPG');



INSERT INTO machine_comment (com_id, user_id, machine_id, username, comment_text) VALUES
(1, 80, 2, 'TestniUporabnik', 'Klopca za Bench press je nerodna v primeru, da potrebujemo pomoc iz varnostnih razlogov.');

SET SCAN OFF;
INSERT INTO auser (user_id, username, email, pasword) VALUES
(1, 'Rexalger', 'vojvoda.gregor@gmail.com', '123');
(69, 'Martins', 'Martina.homjak@gmail.com', 'UnaiRoxy'),
(70, 'Pizzaman', 'Matjazinho@gmail.com', 'matjazinho'),
(71, 'Pizzaman', 'Matjazinho@gmail.com', 'matjazinho'),
(72, 'Veljakjan', 'Veljak.jan@gmail.com', 'godiamond7'),
(73, 'Lemer', 'gattsspada@gmail.com', 'lemar123'),
(74, 'Venisnik123', 'anej.venisnik123@gmail.com', 'mechquest007'),
(75, 'Kristjanlazar', 'Kristjan.lazar@gmail.com ', 'fitnes1234'),
(76, 'martinfucker', 'martin.franetic7@gmail.com', 'martinstikalo'),
(77, 'martinfucker', 'martin.franetic7@gmail.com', 'martinstikalo'),
(78, 'TomaÅ¾ ', 'TomaÅ¾.Krampf@gmail.com', 'praserjavo0'),
(79, '', '', ''),
(80, 'TestniUporabnik', 'testniUporabnik@gmail.com', 'TestniUporabnik1');


--ALTER TABLE exercise
--  ADD PRIMARY KEY (exercise_id),
--  ADD KEY machine_id (machine_id);

alter table exercise 
add constraint machine_id
foreign key (machine_id)
references machine(machine_id);

ALTER TABLE `exercise_history`
  ADD PRIMARY KEY (`exeh_id`),
  ADD KEY `exercise_id` (`exercise_id`);


ALTER TABLE `machine`
  ADD PRIMARY KEY (`machine_id`);


ALTER TABLE `machine_comment`
  ADD PRIMARY KEY (`com_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `machine_id` (`machine_id`);


ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);


