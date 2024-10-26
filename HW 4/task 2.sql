UPDATE petEvent SET remark = "5 kittens, 3 female, 2 male" WHERE petname = "Fluffy";
UPDATE petEvent SET petname = "Claws" WHERE id = 5;
UPDATE petPet SET death = "2020-09-01" WHERE petname = "Puffball";
DELETE FROM petEvent WHERE petname = "Fluffy";
DELETE FROM petPet WHERE petowner = "Harold";