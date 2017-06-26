

***********************************************************************************
***							estimating model fit								***
***********************************************************************************

* compare nbreg w/ & wo exception_mag: no changes in significance (except exception mag sig @ P < .001

nbreg retweet_count state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening if exception_mag == 0, vce(cluster from_user_screen_name)
estimates store wexcep
nbreg retweet_count state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening, vce(cluster from_user_screen_name)
estimates store woexcep
estimates table wexcep woexcep, stats(N se) star(.05 .01 .001)



* The dependent variables are overdispersed: not good for Poisson

tab retweet_dummy if exception_mag ==0
sum retweet_dummy if exception_mag ==0
sum retweet_dummy if exception_mag ==0, detail
sum retweet_count if exception_mag ==0, detail


* fitstat - compare zinb to nbreg - provides very strong support for zinb (difference in BIC only 150.7 though)

zinb retweet_count state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening if exception_mag == 0, inflate(state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening) vce(cluster from_user_screen_name)
fitstat, save
nbreg retweet_count state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening if exception_mag == 0, vce(cluster from_user_screen_name)
fitstat, diff


* tables - compare zinb to nbreg (minimal changes in significance)

zinb retweet_count state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening if exception_mag == 0, inflate(state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening) vce(cluster from_user_screen_name)
estimates store zinb
nbreg retweet_count state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening if exception_mag == 0, vce(cluster from_user_screen_name)
estimates store nbreg
estimates table zinb nbreg, stats(N se) star(.05 .01 .001)



* fitstat - compare zip to nbreg (fits the inflate portion of the zip model to the constant)

zip retweet_count state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening if exception_mag == 0, inflate(_cons) vce(cluster from_user_screen_name)
fitstat, save
nbreg retweet_count state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening if exception_mag == 0, vce(cluster from_user_screen_name)
fitstat, diff



***********************************************************************************
***						Final models & Output tables							***
***********************************************************************************

******   Table 3c, panel 2: logit model
logit retweet_dummy state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening if exception_mag == 0, vce(cluster from_user_screen_name)
estimates table, stats(N se) b(%-9.4g) se(%9.4g)

******   Table 3c, panel 2: nbreg model
nbreg retweet_count state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening if exception_mag == 0, vce(cluster from_user_screen_name)
estimates table, stats(N se) b(%-9.4g) se(%9.4g)





******   PREDICTED PROBABILITY & IRR CONVERSIONS   *********


***********************************************************************************
***		Table 3d, panel 1: Predicted Probability estimates for logit model		***
***********************************************************************************
* The next line is to predict the probability that an MTOT tweet is retweeted 
di exp(15.22934-15.17851*0-16.09195*0-16.83175*0-16.19279*0-12.98544*0)/(1+exp(15.22934-15.17851*0-16.09195*0-16.83175*0-16.19279*0-12.98544*0))
 
* The next line is to predict the probability that a Kauffman tweet is retweeted 
 
di exp(15.22934-15.17851*0-16.09195*0-16.83175*0-16.19279*0-12.98544*1)/(1+exp(15.22934-15.17851*0-16.09195*0-16.83175*0-16.19279*0-12.98544*1))
 
* The next line is to predict the probability that a bus_orgs_unofficial tweet is retweeted 
 
di exp(15.22934-15.17851*0-16.09195*0-16.83175*0-16.19279*1-12.98544*0)/(1+exp(15.22934-15.17851*0-16.09195*0-16.83175*0-16.19279*1-12.98544*0))
 
* The next line is to predict the probability that an other_ind tweet is retweeted
 
di exp(15.22934-15.17851*0-16.09195*0-16.83175*1-16.19279*0-12.98544*0)/(1+exp(15.22934-15.17851*0-16.09195*0-16.83175*1-16.19279*0-12.98544*0))
 
*The next line is to predict the probability that an state_account tweet is retweeted
di exp(15.22934-15.17851)/(1+exp(15.22934-15.17851))

*The next line is to predict the probability that an bus_int_ind tweet is retweeted
di exp(15.22934-16.09195)/(1+exp(15.22934-16.09195))



***********************************************************************************
***					Table 3d, panel 2: IRR for nbreg model						***
***********************************************************************************
nbreg retweet_count state_account bus_int_ind other_ind bus_orgs_unofficial exception_mag kauffman from_user_followers_count from_user_listed_count from_user_statuses_count url_dummy mention_dummy monday tuesday wednesday thursday friday saturday night day evening if exception_mag == 0, vce(cluster from_user_screen_name) irr
