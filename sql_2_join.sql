# SQL Join exercise
#

#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
select * from city where name like 'ping%' order by Population asc;
#
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
select * from city where name like 'ran' order by Population desc;
#
#
# 3: Count all cities
select count(*) from city;
#
#
# 4: Get the average population of all cities
select avg(population) from city;
#
#
# 5: Get the biggest population found in any of the cities
select max(population) from city;
#
#
# 6: Get the smallest population found in any of the cities
select min(population) from city;
#
#
# 7: Sum the population of all cities with a population below 10000
select sum(population) from city where Population < 10000;
#
#
# 8: Count the cities with the countrycodes MOZ and VNM 
select count(*) from city where CountryCode in('MOZ', 'VNM');
#
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
select countrycode, count(*) from city where CountryCode in ('MOZ', 'VNM') group by CountryCode;
#
#
# 10: Get average population of cities in MOZ and VNM
select countrycode, avg(population) num from city where CountryCode in ('MOZ', 'VNM') group by CountryCode;
#
#
# 11: Get the countrycodes with more than 200 cities
select countrycode, count(*) citycount from city group by CountryCode having citycount > 200;
#
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
select countrycode, count(*) citycount from city group by CountryCode having citycount > 200 order by citycount;
#
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
select language from city inner join countrylanguage using (countrycode) where Population between 400 and 500;
#
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
select name, language from city inner join countrylanguage on city.CountryCode = countrylanguage.CountryCode where Population between 500 and 600;
#
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
select c2.name from city c1, city c2 where c1.CountryCode = c2.CountryCode and c1.Population = 122199;
#
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
select c2.name from city c1, city c2 where c1.CountryCode = c2.CountryCode and c1.Population and c1.Population =122199 and c2.Population<>122199;
#
#
# 17: What are the city names in the country where Luanda is capital?
select nc.name from city yc, country c, city nc where yc.Name = 'Luanda' and yc.ID = c.Capital and c.Code = nc.CountryCode;
#
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
select oci.name from city yci, country yco, country oco, city oci where yci.name = 'Yaren' and yci.id = yco.Capital and yco.Region = oco.Region and oco.Capital = oci.ID;
#
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
select distinct Language from city, country cc, country rc, countrylanguage cl where city.Name = 'Riga' and city.CountryCode = cc.Code and cc.Region = rc.Region and rc.Code = cl.CountryCode;
#
#
# 20: Get the name of the most populous city
select name from city tc where tc.population = (select max(population) from city);
-- select cc.Name, cc.population, max(mc.population) mp from city cc, city mc group by cc.Name having cc.Population = mp;
#
