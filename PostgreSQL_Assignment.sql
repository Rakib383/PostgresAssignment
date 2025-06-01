-- Active: 1747821811215@@127.0.0.1@5432@conservation_db


create table rangers(
    ranger_id  SERIAL PRIMARY KEY,
    name VARCHAR(50),
    region VARCHAR(100)

);



insert into rangers(name,region) values('Alice Green','Northern Hills'),('Bob White','River Delta'),('Carol King','Mountain Range');


create table species(
    species_id serial PRIMARY KEY,
    common_name VARCHAR(50),
    scientific_name VARCHAR(50),
    discovery_date DATE,
    conservation_status VARCHAR(50)

);

insert into species(common_name,scientific_name,discovery_date,conservation_status) values('Snow Leopard','Panthera uncia','1775-01-01','Endangered'),
('Bengal Tiger','Panthera tigris tigris','1758-01-01','Endangered'),
('Red Panda','Ailurus fulgens','1825-01-01','Vulnerable'),
('Asiatic Elephant','Elephas maximus indicus','1758-01-01','Endangered');



create table sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id  integer REFERENCES rangers(ranger_id),
    species_id integer REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location VARCHAR(100),
    notes text);

    insert into sightings(species_id,ranger_id,location,sighting_time,notes) values(
        1,1,'Peak Ridge','2024-05-10 07:45:00','Camera trap image captured'
    ),(2,2,'Bankwood Area','2024-05-12 16:20:00','Juvenile seen'),
    (3,3,'Bamboo Grove East','2024-05-15 09:10:00','Feeding observed'),(
        1,2,'Snowfall Pass','2024-05-18 18:30:00',NULL
    );


    --  Problem-1

insert into  rangers(name,region) values('Derek Fox','Coastal Plains');


-- problem-2

select count(DISTINCT species_id) as unique_species_count from sightings;


-- problem-3

select * from sightings where location like '%Pass%';

-- problem-4

select rangers.name,count(sightings.sighting_id) as total_sightings from sightings join rangers on sightings.ranger_id = rangers.ranger_id group by rangers.name order by rangers.name asc ;

-- problem-5

select species.common_name from species left join sightings on species.species_id = sightings.species_id where sightings.species_id is null;

-- problem-6

select species.common_name,sightings.sighting_time,rangers.name from sightings join species on sightings.species_id = species.species_id join rangers on sightings.ranger_id = rangers.ranger_id order by sightings.sighting_time DESC limit 2;

        -- problem-7

update species 
set conservation_status = 'Historic' where discovery_date < '1800-01-01';


--  problem-8 

select sighting_id,
case 
    when  extract(hour from sighting_time) <12 then 'Morning'
    when extract(hour from sighting_time) between 12 and 17 then 'Afternoon'
    else 'Evening'
end as time_of_day 
from sightings;


        -- problem-9

DELETE from rangers 
    where not EXISTS(
        select 1 from sightings
            where sightings.ranger_id = rangers.ranger_id
    );





