library(limer)
library(tidyverse)
options(lime_api = 'https://survey.chavi.ai/index.php/admin/remotecontrol')
options(lime_username = username)
options(lime_password = pass)
get_session_key()

# list all surveys. A vector is returned
survey_vector<-call_limer(method='list_surveys')
data <- get_responses(iSurveyID= 714712)
participants <- get_participants(714712, iStart=1, iLimit=10, bUnused=FALSE, aAttributes=FALSE)

newdata <- left_join(data, participant,by="token") %>% relocate(participant_info, .after = id)


