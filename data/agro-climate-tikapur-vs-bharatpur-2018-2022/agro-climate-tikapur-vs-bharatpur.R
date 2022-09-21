require(tidyverse)
require(tsibble)
require(lubridate)

# Date range: January 1, 2018 -- June 17, 2022
# Daily weather (precipitation and temperature) of Tikapur-1, Kailali (inside CNRM compound) during few preceding years of study
# Cumulative monthly precipiation
# Daily maximum temperature

tikapur_data_2018 <- read_csv("./data/POWER_Point_Daily_20180101_20220617_028d5314N_081d1329E_LST_tikapur.csv", skip = 24) %>% 
  mutate(region = "tikapur") %>% 
  mutate_all(~na_if(., -999))
bharatpur_data_2018 <- read_csv("./data/POWER_Point_Daily_20180101_20220617_027d7065N_084d4566E_LST_bharatpur.csv", skip = 24) %>% 
  mutate(region = "bharatpur") %>% 
  mutate_all(~na_if(., -999))

tikapur_tsibble <- tikapur_data_2018 %>% 
  mutate(date = paste(YEAR, DOY, sep = "-")) %>% # two columns pasted together
  relocate(date, .before = 2) %>% 
  mutate(date = as_date(date, format = "%Y-%j")) %>% 
  as_tsibble(key = region, index = date)

bharatpur_tsibble <- bharatpur_data_2018 %>% 
  mutate(date = paste(YEAR, DOY, sep = "-")) %>% # two columns pasted together
  relocate(date, .before = 2) %>% 
  mutate(date = as_date(date, format = "%Y-%j")) %>% 
  as_tsibble(key = region, index = date)

tikapur_tsibble %>% 
  mutate(ymonth = yearmonth(date)) %>% 
  index_by(ymonth) %>% 
  summarise(PRECTOTCORR = sum(PRECTOTCORR, na.rm = TRUE)) %>% 
  feasts::gg_season(y = PRECTOTCORR, size = 1.2) +
  labs(x = "Month", y = "Monthly precipitation (in mm)") +
  theme_bw() +
  theme(legend.position = "bottom")

## cumulative precipitation of tikapur and bharatpur for past years since December to June

tikapur_tsibble %>% 
  mutate(ymonth = yearmonth(date)) %>% 
  index_by(ymonth) %>% 
  summarise(PRECTOTCORR = sum(PRECTOTCORR, na.rm = TRUE)) %>% 
  mutate(month_digits  = month(ymonth)) %>% 
  filter(month_digits <= 5 | month_digits == 12) %>% 
  index_by(year = year(ymonth)) %>%
  summarise(cumulative_precipitation = sum(PRECTOTCORR, na.rm = TRUE))

bharatpur_tsibble %>% 
  mutate(ymonth = yearmonth(date)) %>% 
  index_by(ymonth) %>% 
  summarise(PRECTOTCORR = sum(PRECTOTCORR, na.rm = TRUE)) %>% 
  mutate(month_digits  = month(ymonth)) %>% 
  filter(month_digits <= 5 | month_digits == 12) %>% 
  index_by(year = year(ymonth)) %>%
  summarise(cumulative_precipitation = sum(PRECTOTCORR, na.rm = TRUE))

# # temperature
# dhangadhi_tsibble %>% 
#   index_by(ymonth = yearmonth(YYYYMMDD)) %>% 
#   summarise(T2M = mean(T2M, na.rm = TRUE), 
#             T2M_MIN = mean(T2M_MIN, na.rm = TRUE), 
#             T2M_MAX = mean(T2M_MAX, na.rm = TRUE)) %>% 
#   as_tibble() %>% 
#   mutate(month = month(ymonth), 
#          year = year(ymonth)) %>% 
#   ggplot(aes(x = month, color = as.factor(year))) +
#   geom_line(aes(y = T2M), size = 1.4, linetype = 1) +
#   geom_line(aes(y = T2M_MIN), size = 1.2, linetype = 2) +
#   geom_line(aes(y = T2M_MAX), size = 1.2, linetype = 2) +
#   scale_color_discrete(name = "Year") +
#   scale_x_continuous(breaks = 1:12, labels = month.abb) +
#   labs(x = "Month", y = "Average monthly temperature")

gg_season_t2m_max <- dhangadhi_tsibble %>% 
  filter(year(YYYYMMDD) > "2016") %>% 
  feasts::gg_season(y = T2M_MAX, size = 1) + # labels = "right"
  labs(x = "Month", 
       y = expression("Maximum daily temperature from Jan, 2017 to Dec, 2019 "*(~degree*C))) +
  theme(legend.position = "bottom")
gg_season_t2m_max

# ggsave("./maximum_daily_temperature.png", 
#        gg_season_t2m_max, device = "png", 
#        height = 5, width = 12, dpi = 200, units = "in")
