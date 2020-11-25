library(tidyr)
t1 <- table1
t2 <- table2
t3 <- table3
t4a <- table4a
t4b <- table4b

library(tidyverse)
#extract cases
t2_data <- filter(t2, type == "cases") %>%
  rename(cases = count) %>%
  arrange(country, year)
#extract population
t2_population <- t2 %>% 
  filter(type=="population") %>%
  rename(population = count) %>%
  arrange(country,year)
# cases divided by population (incidence rate)
Incidence_rate <- tibble(year=t2_data$year, country=t2_data$country,
                         cases=t2_data$cases,population=t2_population$population) %>%
  mutate(incidence_rate = (cases/population)*10000) %>%
  select(country,year,incidence_rate)
# make the incidence table readable 
Incidence_rate <- Incidence_rate %>%
  mutate(type = "incidence rate") %>%
  rename(count = incidence_rate)
# store back to original table
t2_total <- bind_rows(t2,Incidence_rate) %>%
  arrange(country, year, type, count)

# for table4a + 4b
t4_ab <- tibble(country=t4a$country, "1999" = t4a[["1999"]]/t4b[["1999"]]*10000,"2000"=t4a[["2000"]]/t4b[["2000"]]*10000)
t4_ab <- t4_ab %>% rename(incidence_rate_1999 = "1999",incidence_rate_2000 = "2000") 


t4a %>% gather(1999,2000,key="year",value="cases")

t4a %>% gather("1999","2000",key="year",value="cases")
