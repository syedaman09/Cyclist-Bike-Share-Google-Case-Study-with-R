{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "a494276e",
   "metadata": {
    "papermill": {
     "duration": 0.009451,
     "end_time": "2022-11-19T00:02:50.419896",
     "exception": false,
     "start_time": "2022-11-19T00:02:50.410445",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Introduction\n",
    "\n",
    "                                      Google Capstone Project\n",
    "Cyclitic Bike Share: Case Study\n",
    "\n",
    "Syed Amanullah\n",
    "\n",
    "Welcome to the Cyclistic bike-share analysis case study! In this case study, I will be analysing a public data set of a bike-share company in Chicago.\n",
    "The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, team will design a new marketing strategy to convert casual riders into annual members.\n",
    "\n",
    "The following data analysis steps will be followed:\n",
    "•\tAsk,\n",
    "•\tPrepare,\n",
    "•\tProcess,\n",
    "•\tAnalyse,\n",
    "•\tShare,\n",
    "•\tAct.\n",
    "\n",
    "## Ask-1\n",
    "\n",
    "Three questions will guide the future marketing program: \n",
    "1.\tHow do annual members and casual riders use Cyclistic bikes differently?\n",
    "2.\tWhy would casual riders buy Cyclistic annual memberships? \n",
    "3.\tHow can Cyclistic use digital media to influence casual riders to become members? \n",
    "\n",
    "**Business Task:**\n",
    "\n",
    "What could motivate the “casual” users to change to an “annual” member based on their behaviour?\n",
    "\n",
    " ## Prepare-2\n",
    " \n",
    "I will use Cyclistic’s historical trip data to analyse and identify trends. The data has been made available by Motivate International Inc. Datasets are available here link.\n",
    "Key task\n",
    "\n",
    "1.\tDownload data and store it appropriately.\n",
    "•\tData has been downloaded and copies have been stored securely on my computer and here on Kaggle.\n",
    "\n",
    "2.\tIdentify how it’s organized.\n",
    "•\tThe data is in CSV (comma-separated values) format, and there are a total of 13 columns.\n",
    "\n",
    "3.\tSort and filter the data.\n",
    "•\tFor this analysis, I will be using dataset of last 12 months (Aug 2021- Sept 2022), as it is current and more relevant to the business task and it has the more complete data with geo-location coordinates.\n",
    "\n",
    "4.\tDetermine the credibility of the data.\n",
    "•\tThis is a public data of bike sharing company. Data-privacy issues prohibit me from using riders’ personally identifiable information. Have not used private information of any riders. This data is appropriate for me to answer business questions."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2477179c",
   "metadata": {
    "papermill": {
     "duration": 0.007936,
     "end_time": "2022-11-19T00:02:50.436243",
     "exception": false,
     "start_time": "2022-11-19T00:02:50.428307",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Load and install necessary packages."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "5f0323b3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:02:50.456076Z",
     "iopub.status.busy": "2022-11-19T00:02:50.454073Z",
     "iopub.status.idle": "2022-11-19T00:02:52.173816Z",
     "shell.execute_reply": "2022-11-19T00:02:52.171982Z"
    },
    "papermill": {
     "duration": 1.731939,
     "end_time": "2022-11-19T00:02:52.176263",
     "exception": false,
     "start_time": "2022-11-19T00:02:50.444324",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.5 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Load and install necessary packages.\n",
    "\n",
    "library(geosphere)\n",
    "library(tidyverse)\n",
    "library(ggplot2)\n",
    "library(dplyr)\n",
    "library(lubridate)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "3a0f1e95",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:02:52.224648Z",
     "iopub.status.busy": "2022-11-19T00:02:52.195213Z",
     "iopub.status.idle": "2022-11-19T00:04:27.964835Z",
     "shell.execute_reply": "2022-11-19T00:04:27.963005Z"
    },
    "papermill": {
     "duration": 95.784482,
     "end_time": "2022-11-19T00:04:27.969121",
     "exception": false,
     "start_time": "2022-11-19T00:02:52.184639",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Import CSV files\n",
    "\n",
    "Aug021 <- read.csv(\"../input/bike-share/Bike_share_data/202108-divvy-tripdata.csv\")\n",
    "Sep021 <- read.csv(\"../input/bike-share/Bike_share_data/202109-divvy-tripdata.csv\")\n",
    "Oct021 <- read.csv(\"../input/bike-share/Bike_share_data/202110-divvy-tripdata.csv\")\n",
    "Nov021 <- read.csv(\"../input/bike-share/Bike_share_data/202111-divvy-tripdata.csv\")\n",
    "Dec021 <- read.csv(\"../input/bike-share/Bike_share_data/202112-divvy-tripdata.csv\")\n",
    "Jan022 <- read.csv(\"../input/bike-share/Bike_share_data/202201-divvy-tripdata.csv\")\n",
    "Feb022 <- read.csv(\"../input/bike-share/Bike_share_data/202202-divvy-tripdata.csv\")\n",
    "Mar022 <- read.csv(\"../input/bike-share/Bike_share_data/202203-divvy-tripdata.csv\")\n",
    "Apr022 <- read.csv(\"../input/bike-share/Bike_share_data/202204-divvy-tripdata.csv\")\n",
    "May022 <- read.csv(\"../input/bike-share/Bike_share_data/202205-divvy-tripdata.csv\")\n",
    "Jun022 <- read.csv(\"../input/bike-share/Bike_share_data/202206-divvy-tripdata.csv\")\n",
    "Jul022 <- read.csv(\"../input/bike-share/Bike_share_data/202206-divvy-tripdata.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "28f82fae",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:04:27.993889Z",
     "iopub.status.busy": "2022-11-19T00:04:27.992097Z",
     "iopub.status.idle": "2022-11-19T00:04:56.450603Z",
     "shell.execute_reply": "2022-11-19T00:04:56.448829Z"
    },
    "papermill": {
     "duration": 28.471877,
     "end_time": "2022-11-19T00:04:56.453430",
     "exception": false,
     "start_time": "2022-11-19T00:04:27.981553",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Merged monthly data in to the large data frame\n",
    "\n",
    "Bike_Data <- rbind(Aug021,Sep021,Oct021,Nov021,Dec021,Jan022,Feb022,Mar022,Apr022,May022,Jun022,Jul022)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "18301ac7",
   "metadata": {
    "papermill": {
     "duration": 0.008209,
     "end_time": "2022-11-19T00:04:56.470255",
     "exception": false,
     "start_time": "2022-11-19T00:04:56.462046",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Process-3"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "d7e122d0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:04:56.489793Z",
     "iopub.status.busy": "2022-11-19T00:04:56.488332Z",
     "iopub.status.idle": "2022-11-19T00:05:03.690345Z",
     "shell.execute_reply": "2022-11-19T00:05:03.688653Z"
    },
    "papermill": {
     "duration": 7.214191,
     "end_time": "2022-11-19T00:05:03.692524",
     "exception": false,
     "start_time": "2022-11-19T00:04:56.478333",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>5847179</li><li>13</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 5847179\n",
       "\\item 13\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 5847179\n",
       "2. 13\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 5847179      13"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t5847179 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"99103BB87CC6C1BB\" \"EAFCCCFB0A3FC5A1\" \"9EF4F46C57AD234D\" \"5834D3208BFAF1DA\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"10-08-2021 17:15\" \"10-08-2021 17:23\" \"21-08-2021 02:34\" \"21-08-2021 06:52\" ...\n",
      " $ ended_at          : chr  \"10-08-2021 17:22\" \"10-08-2021 17:39\" \"21-08-2021 02:50\" \"21-08-2021 07:08\" ...\n",
      " $ start_station_name: chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_station_id  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_name  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_lat         : num  41.8 41.8 42 42 41.8 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.7 -87.7 -87.6 ...\n",
      " $ end_lat           : num  41.8 41.8 42 42 41.8 ...\n",
      " $ end_lng           : num  -87.7 -87.6 -87.7 -87.7 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type       started_at          ended_at        \n",
       " Length:5847179     Length:5847179     Length:5847179     Length:5847179    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " start_station_name start_station_id   end_station_name   end_station_id    \n",
       " Length:5847179     Length:5847179     Length:5847179     Length:5847179    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.64   Min.   :-87.84   Min.   :41.39   Min.   :-88.97  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :45.64   Max.   :-73.80   Max.   :42.17   Max.   :-87.50  \n",
       "                                  NA's   :5698    NA's   :5698    \n",
       " member_casual     \n",
       " Length:5847179    \n",
       " Class :character  \n",
       " Mode  :character  \n",
       "                   \n",
       "                   \n",
       "                   \n",
       "                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "## Data Cleaning and preparing for analysis\n",
    "\n",
    "# Exploring Data set to know more about it.\n",
    "\n",
    "dim(Bike_Data)#Dimesions of the data frame\n",
    "colnames(Bike_Data)#Columns name of the data frame\n",
    "str(Bike_Data)#Structure and data types\n",
    "summary(Bike_Data) \n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "04afa48e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:05:03.713177Z",
     "iopub.status.busy": "2022-11-19T00:05:03.711682Z",
     "iopub.status.idle": "2022-11-19T00:05:04.959145Z",
     "shell.execute_reply": "2022-11-19T00:05:04.957401Z"
    },
    "papermill": {
     "duration": 1.260392,
     "end_time": "2022-11-19T00:05:04.961618",
     "exception": false,
     "start_time": "2022-11-19T00:05:03.701226",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "\n",
    "# Dropped all Na/missing values\n",
    "\n",
    "Bike_Data <- drop_na(Bike_Data)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "1cc638b9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:05:04.982133Z",
     "iopub.status.busy": "2022-11-19T00:05:04.980437Z",
     "iopub.status.idle": "2022-11-19T00:05:36.170366Z",
     "shell.execute_reply": "2022-11-19T00:05:36.168742Z"
    },
    "papermill": {
     "duration": 31.212724,
     "end_time": "2022-11-19T00:05:36.182849",
     "exception": false,
     "start_time": "2022-11-19T00:05:04.970125",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li><li>'Date'</li><li>'Day'</li><li>'Month'</li><li>'Year'</li><li>'Day_OF_Week'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\item 'Date'\n",
       "\\item 'Day'\n",
       "\\item 'Month'\n",
       "\\item 'Year'\n",
       "\\item 'Day\\_OF\\_Week'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "14. 'Date'\n",
       "15. 'Day'\n",
       "16. 'Month'\n",
       "17. 'Year'\n",
       "18. 'Day_OF_Week'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"      \"Date\"               \"Day\"               \n",
       "[16] \"Month\"              \"Year\"               \"Day_OF_Week\"       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Seprating the dates in to day,month, year and day of the week\n",
    "\n",
    "Bike_Data$Date <- as.Date(Bike_Data$started_at)\n",
    "Bike_Data$Day <- format(as.Date(Bike_Data$Date),\"%d\")\n",
    "Bike_Data$Month <- format(as.Date(Bike_Data$Date),\"%B\")\n",
    "Bike_Data$Year <- format(as.Date(Bike_Data$Date),\"%Y\")\n",
    "Bike_Data$Day_OF_Week <- format(as.Date(Bike_Data$Date),\"%A\")\n",
    "\n",
    "colnames(Bike_Data)# To get columns name of the data frame"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "62586832",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:05:36.203349Z",
     "iopub.status.busy": "2022-11-19T00:05:36.201916Z",
     "iopub.status.idle": "2022-11-19T00:05:36.217664Z",
     "shell.execute_reply": "2022-11-19T00:05:36.216032Z"
    },
    "papermill": {
     "duration": 0.028506,
     "end_time": "2022-11-19T00:05:36.219867",
     "exception": false,
     "start_time": "2022-11-19T00:05:36.191361",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Suprressing warning \n",
    "\n",
    "options(warn=-1)\n",
    "\n",
    "# Not allowing R to use scientific notation till specified number\n",
    " options(scipen=1000000)\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "70478cdf",
   "metadata": {
    "papermill": {
     "duration": 0.008919,
     "end_time": "2022-11-19T00:05:36.237404",
     "exception": false,
     "start_time": "2022-11-19T00:05:36.228485",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Creating new column started time and ended and changing their format as format are inconsitence"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "d16ed2fb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:05:36.258164Z",
     "iopub.status.busy": "2022-11-19T00:05:36.256558Z",
     "iopub.status.idle": "2022-11-19T00:06:00.446688Z",
     "shell.execute_reply": "2022-11-19T00:06:00.444851Z"
    },
    "papermill": {
     "duration": 24.203033,
     "end_time": "2022-11-19T00:06:00.449103",
     "exception": false,
     "start_time": "2022-11-19T00:05:36.246070",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "Bike_Data$started_time <- format(Bike_Data$started_at, format = \"%H:%M\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "37ff6234",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:06:00.471016Z",
     "iopub.status.busy": "2022-11-19T00:06:00.469485Z",
     "iopub.status.idle": "2022-11-19T00:06:25.420274Z",
     "shell.execute_reply": "2022-11-19T00:06:25.418445Z"
    },
    "papermill": {
     "duration": 24.966072,
     "end_time": "2022-11-19T00:06:25.424060",
     "exception": false,
     "start_time": "2022-11-19T00:06:00.457988",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "Bike_Data$ended_time<- format(Bike_Data$ended_at, format = \"%H:%M\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "b842f34c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:06:25.445829Z",
     "iopub.status.busy": "2022-11-19T00:06:25.444321Z",
     "iopub.status.idle": "2022-11-19T00:06:33.588408Z",
     "shell.execute_reply": "2022-11-19T00:06:33.585457Z"
    },
    "papermill": {
     "duration": 8.158382,
     "end_time": "2022-11-19T00:06:33.591835",
     "exception": false,
     "start_time": "2022-11-19T00:06:25.433453",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t5841481 obs. of  21 variables:\n",
      " $ ride_id           : chr  \"99103BB87CC6C1BB\" \"EAFCCCFB0A3FC5A1\" \"9EF4F46C57AD234D\" \"5834D3208BFAF1DA\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"electric_bike\" \"electric_bike\" \"electric_bike\" ...\n",
      " $ started_at        : chr  \"10-08-2021 17:15\" \"10-08-2021 17:23\" \"21-08-2021 02:34\" \"21-08-2021 06:52\" ...\n",
      " $ ended_at          : chr  \"10-08-2021 17:22\" \"10-08-2021 17:39\" \"21-08-2021 02:50\" \"21-08-2021 07:08\" ...\n",
      " $ start_station_name: chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_station_id  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_name  : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ end_station_id    : chr  \"\" \"\" \"\" \"\" ...\n",
      " $ start_lat         : num  41.8 41.8 42 42 41.8 ...\n",
      " $ start_lng         : num  -87.7 -87.7 -87.7 -87.7 -87.6 ...\n",
      " $ end_lat           : num  41.8 41.8 42 42 41.8 ...\n",
      " $ end_lng           : num  -87.7 -87.6 -87.7 -87.7 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"member\" \"member\" ...\n",
      " $ Date              : Date, format: \"10-08-20\" \"10-08-20\" ...\n",
      " $ Day               : chr  \"20\" \"20\" \"20\" \"20\" ...\n",
      " $ Month             : chr  \"August\" \"August\" \"August\" \"August\" ...\n",
      " $ Year              : chr  \"10\" \"10\" \"21\" \"21\" ...\n",
      " $ Day_OF_Week       : chr  \"Friday\" \"Friday\" \"Friday\" \"Friday\" ...\n",
      " $ started_time      : chr  \"10-08-2021 17:15   \" \"10-08-2021 17:23   \" \"21-08-2021 02:34   \" \"21-08-2021 06:52   \" ...\n",
      " $ ended_time        : chr  \"10-08-2021 17:22   \" \"10-08-2021 17:39   \" \"21-08-2021 02:50   \" \"21-08-2021 07:08   \" ...\n",
      " $ ride_length       :Formal class 'Interval' [package \"lubridate\"] with 3 slots\n",
      "  .. ..@ .Data: num  7 16 16 16 9 6 16 6 1 18 ...\n",
      "  .. ..@ start: POSIXct, format: \"2010-08-20 21:17:15\" \"2010-08-20 21:17:23\" ...\n",
      "  .. ..@ tzone: chr \"UTC\"\n"
     ]
    }
   ],
   "source": [
    "\n",
    "# Adding new columns as Ride length and ride distance \n",
    "\n",
    "Bike_Data$ride_length <- interval(Bike_Data$started_time,Bike_Data$ended_time)\n",
    "\n",
    "str(Bike_Data) #to inspect the structure of the columns\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "6fe42f1b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:06:33.613265Z",
     "iopub.status.busy": "2022-11-19T00:06:33.611737Z",
     "iopub.status.idle": "2022-11-19T00:06:33.628626Z",
     "shell.execute_reply": "2022-11-19T00:06:33.626862Z"
    },
    "papermill": {
     "duration": 0.031046,
     "end_time": "2022-11-19T00:06:33.631876",
     "exception": false,
     "start_time": "2022-11-19T00:06:33.600830",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "Bike_Data$ride_length <-as.numeric(Bike_Data$ride_length) # Changing ride length in to numeric"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "6060aecc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:06:33.653578Z",
     "iopub.status.busy": "2022-11-19T00:06:33.651923Z",
     "iopub.status.idle": "2022-11-19T00:06:46.731243Z",
     "shell.execute_reply": "2022-11-19T00:06:46.729169Z"
    },
    "papermill": {
     "duration": 13.093674,
     "end_time": "2022-11-19T00:06:46.734378",
     "exception": false,
     "start_time": "2022-11-19T00:06:33.640704",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Ride Distance\n",
    "\n",
    "Bike_Data$Ride_distance <- distGeo(matrix(c(Bike_Data$start_lng,Bike_Data$start_lat),ncol=2),\n",
    "matrix(c(Bike_Data$end_lng,Bike_Data$end_lat),ncol=2)) \n",
    "\n",
    "Bike_Data$Ride_distance <- Bike_Data$Ride_distance/1000 # Distance in KM\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "2c37c2a6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:06:46.756523Z",
     "iopub.status.busy": "2022-11-19T00:06:46.755008Z",
     "iopub.status.idle": "2022-11-19T00:06:50.847609Z",
     "shell.execute_reply": "2022-11-19T00:06:50.845886Z"
    },
    "papermill": {
     "duration": 4.106359,
     "end_time": "2022-11-19T00:06:50.850119",
     "exception": false,
     "start_time": "2022-11-19T00:06:46.743760",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Dropped all na/missing values\n",
    "\n",
    "Bike_Data <- drop_na(Bike_Data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "befe10ea",
   "metadata": {
    "papermill": {
     "duration": 0.009845,
     "end_time": "2022-11-19T00:06:50.869621",
     "exception": false,
     "start_time": "2022-11-19T00:06:50.859776",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**#The data frame includes a few hundred entries when bikes where taken out of docks and checked \n",
    "for quality by Divvy where ride_length was negative or \"zero\"**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "4fc96ad9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:06:50.903118Z",
     "iopub.status.busy": "2022-11-19T00:06:50.901654Z",
     "iopub.status.idle": "2022-11-19T00:07:03.618223Z",
     "shell.execute_reply": "2022-11-19T00:07:03.616405Z"
    },
    "papermill": {
     "duration": 12.742641,
     "end_time": "2022-11-19T00:07:03.621597",
     "exception": false,
     "start_time": "2022-11-19T00:06:50.878956",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "Bike_Data <-Bike_Data[!(Bike_Data$ride_length <0),]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "732d745b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:07:03.643366Z",
     "iopub.status.busy": "2022-11-19T00:07:03.641833Z",
     "iopub.status.idle": "2022-11-19T00:07:08.319431Z",
     "shell.execute_reply": "2022-11-19T00:07:08.317670Z"
    },
    "papermill": {
     "duration": 4.691133,
     "end_time": "2022-11-19T00:07:08.321606",
     "exception": false,
     "start_time": "2022-11-19T00:07:03.630473",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 5,841,266\n",
      "Columns: 22\n",
      "$ ride_id            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"99103BB87CC6C1BB\", \"EAFCCCFB0A3FC5A1\", \"9EF4F46C57…\n",
      "$ rideable_type      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"electric_bike\", \"electric_bike\", \"electric_bike\", …\n",
      "$ started_at         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"10-08-2021 17:15\", \"10-08-2021 17:23\", \"21-08-2021…\n",
      "$ ended_at           \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"10-08-2021 17:22\", \"10-08-2021 17:39\", \"21-08-2021…\n",
      "$ start_station_name \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ start_station_id   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ end_station_name   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"Clark St & Grace St\", …\n",
      "$ end_station_id     \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"TA1307000127\", \"\", \"\",…\n",
      "$ start_lat          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.77000, 41.77000, 41.95000, 41.97000, 41.79000, 4…\n",
      "$ start_lng          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.68000, -87.68000, -87.65000, -87.67000, -87.600…\n",
      "$ end_lat            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.77000, 41.77000, 41.97000, 41.95000, 41.77000, 4…\n",
      "$ end_lng            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.68000, -87.63000, -87.66000, -87.65000, -87.620…\n",
      "$ member_casual      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"member\", \"member\", \"member\", \"member\", \"member\", \"…\n",
      "$ Date               \u001b[3m\u001b[90m<date>\u001b[39m\u001b[23m 10-08-20, 10-08-20, 21-08-20, 21-08-20, 19-08-20, …\n",
      "$ Day                \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"20\", \"20\", \"20\", \"20\", \"20\", \"20\", \"20\", \"20\", \"20…\n",
      "$ Month              \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"August\", \"August\", \"August\", \"August\", \"August\", \"…\n",
      "$ Year               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"10\", \"10\", \"21\", \"21\", \"19\", \"19\", \"19\", \"13\", \"17…\n",
      "$ Day_OF_Week        \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Friday\", \"Friday\", \"Friday\", \"Friday\", \"Tuesday\", …\n",
      "$ started_time       \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"10-08-2021 17:15   \", \"10-08-2021 17:23   \", \"21-0…\n",
      "$ ended_time         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"10-08-2021 17:22   \", \"10-08-2021 17:39   \", \"21-0…\n",
      "$ ride_length        \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 7, 16, 16, 16, 9, 6, 16, 6, 1, 18, 6, 6, 30, 34, 15…\n",
      "$ Ride_distance      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0.0000000, 4.1574219, 2.3711021, 2.7719991, 2.77473…\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type       started_at          ended_at        \n",
       " Length:5841266     Length:5841266     Length:5841266     Length:5841266    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " start_station_name start_station_id   end_station_name   end_station_id    \n",
       " Length:5841266     Length:5841266     Length:5841266     Length:5841266    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.64   Min.   :-87.84   Min.   :41.39   Min.   :-88.97  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :45.64   Max.   :-73.80   Max.   :42.17   Max.   :-87.50  \n",
       " member_casual           Date                Day               Month          \n",
       " Length:5841266     Min.   :1-08-20      Length:5841266     Length:5841266    \n",
       " Class :character   1st Qu.:2021-09-26   Class :character   Class :character  \n",
       " Mode  :character   Median :2022-02-08   Mode  :character   Mode  :character  \n",
       "                    Mean   :1746-03-26                                        \n",
       "                    3rd Qu.:2022-06-02                                        \n",
       "                    Max.   :2022-06-30                                        \n",
       "     Year           Day_OF_Week        started_time        ended_time       \n",
       " Length:5841266     Length:5841266     Length:5841266     Length:5841266    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "  ride_length        Ride_distance      \n",
       " Min.   :        0   Min.   :   0.0000  \n",
       " 1st Qu.:      248   1st Qu.:   0.8884  \n",
       " Median :      542   Median :   1.6030  \n",
       " Mean   :    32963   Mean   :   2.1628  \n",
       " 3rd Qu.:     1041   3rd Qu.:   2.8327  \n",
       " Max.   :915148669   Max.   :1192.2456  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Checking clean Data\n",
    "\n",
    "glimpse(Bike_Data)\n",
    "\n",
    "summary(Bike_Data)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fc95b525",
   "metadata": {
    "papermill": {
     "duration": 0.010023,
     "end_time": "2022-11-19T00:07:08.340807",
     "exception": false,
     "start_time": "2022-11-19T00:07:08.330784",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Analyse-4"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f445fd72",
   "metadata": {
    "papermill": {
     "duration": 0.009452,
     "end_time": "2022-11-19T00:07:08.359514",
     "exception": false,
     "start_time": "2022-11-19T00:07:08.350062",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Conducting descriptive analysis**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "39f83064",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:07:08.381647Z",
     "iopub.status.busy": "2022-11-19T00:07:08.379945Z",
     "iopub.status.idle": "2022-11-19T00:07:13.566521Z",
     "shell.execute_reply": "2022-11-19T00:07:13.564647Z"
    },
    "papermill": {
     "duration": 5.200932,
     "end_time": "2022-11-19T00:07:13.569651",
     "exception": false,
     "start_time": "2022-11-19T00:07:08.368719",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. \n",
       "        0       248       542     32963      1041 915148669 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>AVG_ride_length</th><th scope=col>median_ride_length</th><th scope=col>max_ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>59961.12</td><td>687</td><td>915148669</td></tr>\n",
       "\t<tr><td>member</td><td>13041.12</td><td>466</td><td> 31622307</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 4\n",
       "\\begin{tabular}{llll}\n",
       " member\\_casual & AVG\\_ride\\_length & median\\_ride\\_length & max\\_ride\\_length\\\\\n",
       " <chr> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 59961.12 & 687 & 915148669\\\\\n",
       "\t member & 13041.12 & 466 &  31622307\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 4\n",
       "\n",
       "| member_casual &lt;chr&gt; | AVG_ride_length &lt;dbl&gt; | median_ride_length &lt;dbl&gt; | max_ride_length &lt;dbl&gt; |\n",
       "|---|---|---|---|\n",
       "| casual | 59961.12 | 687 | 915148669 |\n",
       "| member | 13041.12 | 466 |  31622307 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual AVG_ride_length median_ride_length max_ride_length\n",
       "1 casual        59961.12        687                915148669      \n",
       "2 member        13041.12        466                 31622307      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "# finding mean, max and median of ride lenght\n",
    "\n",
    "# Comparing Casual and members\n",
    "\n",
    "summary(Bike_Data$ride_length)\n",
    "\n",
    "Bike_Data %>% \n",
    "  group_by(member_casual)%>% summarise(AVG_ride_length=mean(ride_length),median_ride_length=median(ride_length), \n",
    "max_ride_length =max(ride_length))\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "5046b3f1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:07:13.592711Z",
     "iopub.status.busy": "2022-11-19T00:07:13.591133Z",
     "iopub.status.idle": "2022-11-19T00:07:14.567092Z",
     "shell.execute_reply": "2022-11-19T00:07:14.565134Z"
    },
    "papermill": {
     "duration": 0.990209,
     "end_time": "2022-11-19T00:07:14.569573",
     "exception": false,
     "start_time": "2022-11-19T00:07:13.579364",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Visualising member and casual rider by the total ride taken  by them\n",
    "\n",
    "Bike_Data %>%\n",
    "group_by(member_casual) %>%\n",
    "summarise(ride_count=length(ride_id))%>%\n",
    "ggplot(aes(x=member_casual,y=ride_count, fill =member_casual))+ geom_col(position='dodge')+\n",
    "labs(title=\" Member VS Casual distribution\", x= \"Member & Casual\", y=\"ride Count\")\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a2e75c2a",
   "metadata": {
    "papermill": {
     "duration": 0.010111,
     "end_time": "2022-11-19T00:07:14.590032",
     "exception": false,
     "start_time": "2022-11-19T00:07:14.579921",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> By observing the above chart, we can see that there are more member riders in comparison to the casual rider\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "5b20bd04",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:07:14.614665Z",
     "iopub.status.busy": "2022-11-19T00:07:14.612900Z",
     "iopub.status.idle": "2022-11-19T00:07:15.090928Z",
     "shell.execute_reply": "2022-11-19T00:07:15.089031Z"
    },
    "papermill": {
     "duration": 0.49244,
     "end_time": "2022-11-19T00:07:15.093208",
     "exception": false,
     "start_time": "2022-11-19T00:07:14.600768",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>Day_OF_Week</th><th scope=col>number_of_rides</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;ord&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>430235</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>319082</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>277307</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>315546</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>332248</td></tr>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>342139</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>463655</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td>403438</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td>470655</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td>520398</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td>543998</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td>529640</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td>459655</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td>433270</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & Day\\_OF\\_Week & number\\_of\\_rides\\\\\n",
       " <chr> & <ord> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Sunday    & 430235\\\\\n",
       "\t casual & Monday    & 319082\\\\\n",
       "\t casual & Tuesday   & 277307\\\\\n",
       "\t casual & Wednesday & 315546\\\\\n",
       "\t casual & Thursday  & 332248\\\\\n",
       "\t casual & Friday    & 342139\\\\\n",
       "\t casual & Saturday  & 463655\\\\\n",
       "\t member & Sunday    & 403438\\\\\n",
       "\t member & Monday    & 470655\\\\\n",
       "\t member & Tuesday   & 520398\\\\\n",
       "\t member & Wednesday & 543998\\\\\n",
       "\t member & Thursday  & 529640\\\\\n",
       "\t member & Friday    & 459655\\\\\n",
       "\t member & Saturday  & 433270\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 14 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | Day_OF_Week &lt;ord&gt; | number_of_rides &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Sunday    | 430235 |\n",
       "| casual | Monday    | 319082 |\n",
       "| casual | Tuesday   | 277307 |\n",
       "| casual | Wednesday | 315546 |\n",
       "| casual | Thursday  | 332248 |\n",
       "| casual | Friday    | 342139 |\n",
       "| casual | Saturday  | 463655 |\n",
       "| member | Sunday    | 403438 |\n",
       "| member | Monday    | 470655 |\n",
       "| member | Tuesday   | 520398 |\n",
       "| member | Wednesday | 543998 |\n",
       "| member | Thursday  | 529640 |\n",
       "| member | Friday    | 459655 |\n",
       "| member | Saturday  | 433270 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual Day_OF_Week number_of_rides\n",
       "1  casual        Sunday      430235         \n",
       "2  casual        Monday      319082         \n",
       "3  casual        Tuesday     277307         \n",
       "4  casual        Wednesday   315546         \n",
       "5  casual        Thursday    332248         \n",
       "6  casual        Friday      342139         \n",
       "7  casual        Saturday    463655         \n",
       "8  member        Sunday      403438         \n",
       "9  member        Monday      470655         \n",
       "10 member        Tuesday     520398         \n",
       "11 member        Wednesday   543998         \n",
       "12 member        Thursday    529640         \n",
       "13 member        Friday      459655         \n",
       "14 member        Saturday    433270         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Lets see Total ride count of member vs casual by each day\n",
    "\n",
    "# Lets order the days of the week and month\n",
    "\n",
    "Bike_Data$Day_OF_Week <- ordered(Bike_Data$Day_OF_Week, levels =c('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday','Friday',\n",
    "'Saturday'))\n",
    "\n",
    "Bike_Data %>%\n",
    " group_by(member_casual,Day_OF_Week) %>%\n",
    "summarise(number_of_rides= n(),.groups =\"drop\") %>% arrange(member_casual,Day_OF_Week)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "8e8584d5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:07:15.117637Z",
     "iopub.status.busy": "2022-11-19T00:07:15.116029Z",
     "iopub.status.idle": "2022-11-19T00:07:15.672598Z",
     "shell.execute_reply": "2022-11-19T00:07:15.670390Z"
    },
    "papermill": {
     "duration": 0.571516,
     "end_time": "2022-11-19T00:07:15.675134",
     "exception": false,
     "start_time": "2022-11-19T00:07:15.103618",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\noH3DLie++mhZmt7AoEnClXUWXX+hpp+VKqzMUXbTmmd3SHYsKdFfvD9p829/OrkXrtus5xud\n6lmf8c7t2nRe8NmVxTO2HXELD387z9b1EO4oLeup2DxejrUP5GwGOb/7yxuvm2X9sJe2Pb0q\nfEjOZzyP7woUBAX3dEOu6tWmWuTBOT2HTli6euPvp/5J1sXgWq5OnTo5ee93b00p1XbgnPnz\nBrStuOWrySuuJuipUeMHTtoX5dtjyPi3BnS8/uOM9VGJmet/PmLinusl3hj77vQpk1qHWsKn\nDotMtZQMa5F0Y/NvcSnp6/z22T6fcr1y8cPCydSrpv+uJScyXurJi3+LrN8t6yUs+qeDh288\npvcY9PaUccNCXf/+aNigE4mp+bjknAkfNWjtMcMrb46Z+u5bzR7TZ43q++PFhNSEowMnfupU\np834yR+N6Nvu2MbF7/4QISJWqs6Nkp96pmjCtbVpuojIT9uvBLWo51ftpbSkiA3XzSJyeetx\nZ9fSDb1N2VVhfY7kXtOax3fIPR14d6z2eNhHs+f0b1dx6/LJqyIT7/uW3bMnetRuN3lq/7xc\nlxWWlGvHb2e5q7Ss6+fxcuR+H8j3HORrny3rHehZ8sUPln8x7L79Z+6WvL8rUBBwxC5XPNZp\nwuzKO3/ate+3rV+vXjrf4OpT7YkGYd1erR5w/wP1HnWHdXs+VERKtB0S9NXOE9fM187OPWl2\nnT5laIirQUQeq+TW4ZX3Mtcv2uzlgU1a1vE2ikhw4EufbZh01pxax7d5bc9Fy7dfrvliCUtq\n1GcnbtSb8mSulSsiUrFr/ajBC82WOq5OWuyFry5qQV2CPOf/uzTh6oofLsQN+vytZ/xdRaR8\nlcpHO786f/35jzuE5N+S78sctfabP2PeXz60iruziJStUDX1ly4rPjlWf+DxRIveokWjx3xM\nUi5k0mjfS26eInLtYLZV50bJxZ+vnbZ69c83k551u7o5OqlXo6LO7qUaepu2/XixbaeQ3/Zc\n8yrVX8u+ihqtNlmZI7nXtJoNP+blHXJPvqFDujUNFZHgtkOLfLnr+PUk8b/Px+bNor07Pldd\nRBKufpdn67LCfOOnkSN/ytqyYu06dycta2lZ5fFy5H4fyPccZGFPo7MmmsHZ2dkgusV6/5m7\n5eovE/P4rkBBQLDLLaVCG/QIbSAiidcjDu3f992qleP7HZz55ZyS97vFKrBpqcyvCxmcRJdr\n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\nRK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Let's visualize days of the week and number of rides taken by member and casual riders.\n",
    "\n",
    "Bike_Data %>% group_by(member_casual,Day_OF_Week) %>%\n",
    "summarise(number_of_rides= n(),.groups =\"drop\") %>% arrange(member_casual,Day_OF_Week)%>%\n",
    "ggplot(aes(x = Day_OF_Week, y = number_of_rides, fill = member_casual)) +\n",
    " labs(title =\"Total rides of Members and Casual riders Vs. Day of the week\") +\n",
    " geom_col(width=0.5, position = position_dodge(width=0.5)) \n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "55b9613e",
   "metadata": {
    "papermill": {
     "duration": 0.010869,
     "end_time": "2022-11-19T00:07:15.697140",
     "exception": false,
     "start_time": "2022-11-19T00:07:15.686271",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> By observing the above chart, it is clear that casual riders are active on weekends and members are more active on weekdays compared to weekends.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "3f061b0a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:07:15.722467Z",
     "iopub.status.busy": "2022-11-19T00:07:15.720788Z",
     "iopub.status.idle": "2022-11-19T00:07:16.311205Z",
     "shell.execute_reply": "2022-11-19T00:07:16.309265Z"
    },
    "papermill": {
     "duration": 0.605743,
     "end_time": "2022-11-19T00:07:16.313729",
     "exception": false,
     "start_time": "2022-11-19T00:07:15.707986",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nyzusnD4lPHeVMm5WQqg02X6vyaEfey66EOlRtLCdqVptYl/qSzldxCaEECLqwfyfd+gWzxme\nz9nZxb1wldqN8yZeXr95z57dZ03dShbOLdkCGPqkZz9+23Pp5l2/bt33ysjeq7CrVmtbvEKN\nuuXyvXh4895Td7/mpaXKlvDq0pBeAzcfOn36+JHtW7fffmnRunffFhXcJQ/2zk4r7l2idMWa\ncthjcj6a+HwwYpclZDjraSq5ZYt6uKDDkD8C1s0xM1KdHt/1VKuxpS6vn7X2mEqtsvXstmJq\no+yPlBhxZUC3sRF56/j/1MPcSCWECAocMmK7zYCu5YMfBT8KDnZs2K9TNo3SvbHxu64rrz3X\n2rt9+WWJhLBHd+/eDQ2PtnLIkz9/gQIF8lu/Prtsz32/nxY1lGKRrgu7Vy5asTUs0arW1507\ntqj655kmg+7i3oDFy7eExCarjEyajJjfpYJkC4e8uDK213SLDauGvNlk0I3u0L1szYLLt5yp\nO2hBjyrOkgQLWt5v7OXCQ/0qPQ26tHntry8tPdt169GoYsrd1oaw5wnO2X+jbgpD4g+d2z0t\n2XFC73o2moSrx/cu91/91LbS4rn9zY2ElME+tNMk3WNyPpr4rEg934qSXd8xs1GjRs1b9wo8\n+1zqLO+ST7Ynx0a0bDfZYDAkJwS3+6p7RLLeYDBM/KbV7l17nifqpEoVEbSzddPGfpO36g2G\npNhb7Zs1WfbHK6nC/EV3ZX9An7Ytmrbo4r/lZJxeH/cq7NpvJ7auW/HTxO97dfmmceOmB59L\nMA1biuT4p1v8J7Zs0rhV5yFbTtx+Ezrx5cVTp/4IiZYqWIqkmGutmjT+5UTw2xsntG1xIiLh\nwf6pTVv0SJJoar39Pdv+EhKV8v/J8U+3LprUsknjHqNmX3gUJU2gv0SF+Ddt3iX6rSkHE15f\n7dS8ybiTYRKmSiHbnSbbYPisyGgk6ZOmiw8aPHrWuXsRb2/0atC/tp3Wq/mXju5SriYut2xn\nzt97+6F9iQaq6DNnoxKfnVpgWszPWq0SQsTp9UWq+0q1wqkQwjp//Z8G1n96aunIleePz5xq\n8GjTqYitVGH+YlTCt83s5f7dGxU5uGJKpx6jDgfFFytbqUnrDgNHjpu/ZPWGNatqSLf0qtrU\nqanfyBXzxldzjVk6ZZDfyJnnH0QJIYyM7Ur5+BTJI9mdsCk05sUmdf1y59S+Exau/yPkRVz8\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# By months\n",
    "\n",
    "Bike_Data$Month <- ordered(Bike_Data$Month, levels =c('January','February','March','April','May','June','July','August','September','October','November','December'))\n",
    "\n",
    "Bike_Data %>%\n",
    " group_by(member_casual,Month) %>%\n",
    "  summarise(number_of_rides= n(),.groups =\"drop\") %>% arrange(member_casual,Month)%>%\n",
    "ggplot(aes(x = Month, y = number_of_rides, fill = member_casual)) +\n",
    " labs(title =\"Total rides of Members and Casual riders Vs. Day of the week\") +\n",
    " geom_col(width=.7, position = position_dodge(width=.5)) +\n",
    "theme(axis.text.x = element_text(angle = 60, hjust = 1))\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9e8a5206",
   "metadata": {
    "papermill": {
     "duration": 0.012166,
     "end_time": "2022-11-19T00:07:16.338194",
     "exception": false,
     "start_time": "2022-11-19T00:07:16.326028",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    ">By observing the above graph we can see that members were active throughout the year except in August when casual riders took more rides.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "77688aca",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:07:16.366978Z",
     "iopub.status.busy": "2022-11-19T00:07:16.365262Z",
     "iopub.status.idle": "2022-11-19T00:07:16.987642Z",
     "shell.execute_reply": "2022-11-19T00:07:16.984872Z"
    },
    "papermill": {
     "duration": 0.640965,
     "end_time": "2022-11-19T00:07:16.991037",
     "exception": false,
     "start_time": "2022-11-19T00:07:16.350072",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n/HHGkBHNEnxurmtLRMvbBa2N9FuwdGsFF2bvspH9mzcKe3zdz1Ko31F0+PoZm3dUnRHiLc4Q\nBKsMrt/6vEPLFRsO2ipeLRk7smUPxzt7+ma6u9sbvyOipY1qz39ZadO2427su8XD++vDS92e\nJmF06xEv3yYoWVZf+GLP8PYTwsYtWjq9rOPhJUN7N+37OHy3hMd8uvDR0X9q6JQKRkFlXs6q\nhjTpdbdc702Hl9so3q4cNbRzU3p2M8RkfcNVM4sKAACgAGJYjn5XRUVFFbSm2dnZ8fl83f81\nGk1MTCZjY9mkVX12dyvb+mT42kpORBT/akHxgEXHn0dUkcRnWh5gqajkWapk6LW9bb2I6OPN\nYL/WB6++euGhvuvu02LMlccTStgSkVYVVamYn0/otQNtvYjo/flVMzedOX3qYoxKe/xFRFWp\nyCiMmEeTfOtsOvbsdVWZiIiS3+8pViF4/9M3gVaZ7O7G29eVHVmJ2KXD9Xc7qxaRy+WR4dN0\n4elWJ6IzUxsOu24Zfee6we40LX08aeLp44PKEJFa/qxbz4m91mwNspdsrFZyW8f9Z8eXN4oq\n0/LkDxu9/CaceBERIBURUezTqSVrrjn7MrK8ldDUdvQyi+prSCQSqVSqX0xISFAoFF+9tcJI\nJpOJxel/HxTAD2luc3BwYBhG93+1Wh0bG5u/8eQxgUBga2urX0xJSUlKSsrHePKehYWFlZWV\nfjEuLk6lKnDXARwdHfM7BPgmuBRbSGm1REJRaprIE1gRkZI1WZ78aWeEUh1c31VX7uA/mWEV\nqyITNfKn/v7+3T1lqfWFDmWtBCkfUnSLIuuiVeq0GD2+vakgYu+FCy189WmZpUtnOwGz7klc\nprtbGZFoOmwioqjby/ps5+3e0MlwFymf9t5MUI7t7KNbFEiK7927N8heQkTn4+ROtRw18tj3\nMXLDVTItF0hKzJ07N0CflrE8hie0EfDMbMdMVAAAAAUTErtCiSd0ntPU/Y++ky89ePHmye3Z\nA1Y6Vh4eaC0yVa6Iu0pEAbLUC6x8kWtREf/54wQLxy5hYWHuaZlW9P11Z2IVbZu76RbtK7Xt\n379/7+51TIUh9Smikj95lJJ6+50i9ly0SvMpPNbE7uJ5Qpdlrb0Odxx57t7T149u6cMjIrX8\nWY9OIcG7dvhafHF7gDzmLMPwrY4valC5tLuXb6M2/U89iiMiYtWX4pWvVvb38CxVvpRH6SrN\n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\nCo9zbdrQ8FWjIJSJf827/XnY/rVdW9YuWzlw2vqTzuy7aWGRhnXOzmh7zqGsflGr+jj56oeg\ng5s6NapZsWbTkB0DYp9uuJmgNBVe8setJz4mb9g4tU7FMhWqN1mwtWv8y81/J6lMh2eyZ2Ie\nzzjwJnnrviWNa1So5lVi2/f1Il6cP6/QaLUp0yOSW7Vv3MHLpYpHsV87+MdE37um1BDRu1f/\n63vgoN+Wi7l5KHNFjoZmTY2JEpFG8XLJj12qlCvh5VvRcHg1OyO1mQ6pRv3TgUljaWlpNKKs\nEzpu5AuFOtN2GY/+mghPPzTrWaJc1+CQSKXGfHl2BqcBCguM2AEUPimf9t5MUO7u7KNbFEiK\n7927N2M1ZcLNrvPurbi7M5urGNYnovNxcqdajhp57KcUiYudJOP2NfKn/v7+3T1lukWe0KGs\nlSDmQ4q+QtTtZX22846c79SkyvW0Mq2WSCjip64isCIiJWsyPGVciblz5wZIRalrszyGJ7QR\n8EyFZ6aZsffChRa+VWWpm7KSlrbjnV4ZrahThLREAj6TGhJfqAuJiEQiaXUvn0quFuMvPM7Y\n/AIrZ0OzrMrUmCgRrW7fatmb8stX7fQUxqwaO1w/vJrlSC2ZGFK19pz2xx+DdP9XKpUpyTH6\nEWKd6PD1MzbvqDojxFts3K6Mo7+Zh2cwNGureLVk7MiWPRzv7Olrsjx7g9MAhQUSO4DCRx5z\nlmH4VscXNVi09UkU6+tfe0LIkqa+NkbVjo0YYt1lXUN7cTZXMaxPrPpSvNJpZX+PM7dULOvg\nWWXMko0D6xU1rG/h2CUsrIt+Mfr+ujOxip+bu+kW1fJnPTqFBO+67WsRpq/DE7osa+01pePI\nc/t+tkt+sSJ4pWPl4YHWopjHmYcnsqk7cGBdInpy+ujVZ4/2Lt9co/86TzHfVHhmmin1KaKS\n33qUova1EBCRXP46Wst+/KjgudotLmE949CF8+1qePPkS07cdnKtXFfMJyIH15JDXCk5SVCo\nEjvdmOXpsd+XIaIya/fe6TkxLFYRZO9nOOR6P/Q73dBs8oeNJz4mn7g+NUAqIiqzYGvXkjXX\n/J00t7yVUKv6POfWp9Ynl7ep5EREITsGFA9YdDNhpj/z97zbn8dcWdu1hC0RTVt/cn8xv2lh\nkQfaehnG8Sg8zrVjwwYNyhsWCq0qNmuW+v+UlJTrIc30I8Tvz6+auenM6VMmx0dTR3/fpP6R\n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\n31inrFQVr3tKFR1bIX6jMjM7q3jBr0TaSzvmDhqxqHzPFUPTxgspw4Oz1PFynsDGkpd+u4+r\niKeMUZLpWViz7DpF9MmBT+VhI9yMym+HP9j4Keae3GKMkxURqRRKImp38f3iZi0qWLAHbpzr\n/Ntuw0eQAQBAAYRzNBRKpmZhNT87a9Lby8FBARmnVDUz1WrGWVsN8XiWf/Rr24Q+9Nq9x/Ap\nVeZnZ018/Wefuj5tRm1r9fOO04s7G27Q6MFZApmE1cSnpM83Qe+VWpG1iL58QJbhbKtZdt21\nKdMNHx1mqqV8AcMSO7pLy57F3TJ9BBkAABRASOygUBLZlCUio1lYY+7Hmionoui7W2pX7/iP\na+ebw3qFVPbUD4JFvb9fad3BB7LShuVR755suB+h352XVzVfIe/AO+PHnBORlcxtTedOr0cN\nezag6+yysscqbZkixg8R183Omhit0u2uXKkm9916XXl8Z/aABrrdRf/v0JZdV/X1PeqOKykR\nHP1ftNimOsuyd9ISSq3qc6RSU8w3dYRPN9vqg+dv7149M62D+1O52jfDbKtGdPPTtmpUTF9i\nqqUiiSMRdbBJHenUPYIs5qOcAACgAENiB4WSqVlYTZWz6tjv209yGbbx9NqJhlOqmppq1cys\nrYZUqs/f7TtyJu0hS/qnVJmanVW3u6Kjf7+1c2Zp2/Qfq5p6cJalcw8XEX/FjY+68tjHC7WM\naLi7lDI8IEs/26r5ftPNT2v46DBTLZVa+dnymC3RCn0TDB9BBgAABRPusYNCydQztXgiXqbl\nca8m3E7UrK5pceHCBcu051/ZOLh6KzN/KFYFj9rFaGfD4zf1s7ayYpeFzqlDcfpZWIVCR6fo\nyH77L+9oWE4V/z79KVUmnscVG3vullK7va7lmTNnkpOTdTMd2PhWKxeY+YOzGD5vTd+ynQb3\nD9u9sqQwclL33V5tVhaXCOjLB2Sp3tyaOPRowPCDhg+fyJTuUWMyJn2WDVcTLeXxmK0V7Dvv\nOV66ZU1/C63RI8gAAKBgQmIHhVX9+ccm84PnDukczbP1r1x/58V5urQm0/LnNx+yrGZwl06G\nWwhs2XMNpU61alR+xs/+Qvcmg8/cbLfzBk8kLefqeahvnSJpP2K4defOL2rfqTW8iWhZj6DR\nRy923hFuY+fcuEbTJTV1T6myPden1Y+nb3TYeZsVSSu7+ZzqF2jPo6eR0Syx37doari7Gsuv\n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\naUzt6hq16tMjx6t9ufyvwf3zGAyuIZs++STDkE2bNh0/fvyrr77K0B4QEGC32x0OR1pWs1gs\ngYGB/v7+ly5dcrX4+fnNmDFj3bp1mzZtql69eqb90w44b948ETk8ZFCrVV+3KFm8oL9fVqsI\n0OvjRty6moi/XjenecNVf5xef/psv8oVs99MAAAyyN8gzHVDowsVkdYFb+UVQ6hBnA4RSfhz\ng4g8l983/Si9/wE3h7sM6FYi7XbTd59JXb/w71S7Idsjl+hb9a7FX/x6j86/Wud/j6APqL1v\n3z7X7WFjXt27ZeP0pacvXPj75OHv7f++7cq/0JB+deb1K1N8ftOm9erUfrpxyy6NI7KfJatD\n5ZS7wa7fq5+In+/hr788/PV/2r022AUHB48aNerzzz9fvHjxq6++mk3PI1evN1y2tl3ZUms7\ntAk23vqobB6j3ilislhdJ6isDkeqzV4+b0j6gatOnr6amOQ/fU5aS74PP4/Mn298vZqpdvu0\nRvVdkXB83ZqfHP5t/m9Ro2pVcw3R6W5/ZKFEiRKVKlUKDw+/du1awYIFM7QvX77c6XQmJia6\nwpnVarVYLBERGX85tFptYGDg+fPnGzdunGn/o0ePnj59ulu3W1fXbVisqI9Oe/jKtWfLlMxq\nFQef/8+leLVqdaDBcPZmnAAAcH9Ud3wEQufvp1JpLsf846tWpeuW+ec17xyeSR+1VkSMKpU2\n2yP7hPlkPj4dR6pDpc6km8N6tUPFcnsNNV/u1qpOsxrPD5/8VMUit46vDf7yx4vjDu34bte+\nn37a2OvtkYXaTP19/agMR0h2OO96qJxyN9ilf33wUeF0Om02m59fdqcxbQ5Hi5UbhtWo8vbT\n//lSjwJ+fgaN5qfL0S1KFheRP/65qVKpigYGpO8zs0mDif9+FUhMSkrTFev39e6S18d4LjbO\n4RS7w+H6dIJTxOZw+ut0aUP0I8Y5HI6//vqrXbt227dvDwkJ0el048aNcx3q5s2bae358+fX\n6/WHDh1q0qSJiJw5c0alUhUpUuTnn38ePnz4/v37NRqNiFgslvj4+MaNG2fVf//+/aNHj+7c\nubOrf6rdnmqzFwrwz2YVBy5Fv/ztD0cH9NSoVCJisdvjzanNSxa7zx8KAAB3Cgh/WS3rPrlg\ne+/JUFfLkm5NlhpGb1/c3P2DLFz9d58hFVy3f5j4g2++zmF6dep9H7nws1UtExd/e9PcIsQo\nIraUU+HFn+6y9/Rb9pEbz8afS/mmlFEjInbLJeu/Z9mu7Z/+9qobc2ZPLVOz6WCRqz/1Llh3\n9HnzcBGJT7G7+thSTu2MM5cXEZHYs1keKqfc/h67R82RI0cWLlxotVq7dOmSTbe/4hJMFstT\nRQvtSvfJgPJ5Q8L8/V6o8kTfzds3d26nVas7rN/SMaK0j1YrIjMPHbE5HGNqVy8S4C//Jj3X\nu9PK5Q0O0OsL+fsbNJruG78ZXauaSqX64rffrQ57j0rlRMQ1xFCxot1ud31atmzZsmkfVnVx\nZei09n79+r344ourVq3S6XQ9e/Zs27at0Wh88skno6OjX3rppaFDh6akpMycOTNPnjy1a9fW\naDSZ9q9Xr56IDBs2bODAgTab7aMN2wIN+sr5Q9NKunMVBf39LpsSn9+8fUStailW65SfDucx\nGuoVKfRAfjoAAKRnyNPo03bFhjRoGjzrjacqFjy6cdbgNT9OP1I9RwfZP7Lh6+pZrZ8IPb7t\ni+Gr/uy9ascDOXJo5Medw1d1r9d1zrRhpYIsy98bdNNSZnzJIOM/T2lUKyYv2DqqebmYP4/M\nfXusViVXfjljKl3Lp7Bj7ifTLgYWe61VDaPlyop3f/AJbVnMoGkaYvy2zxu75w8LTr08d1yf\nZPut+GYMzvJQATn8hpccBLsjq94dNnnJmeiYXy5e+3b4KL/uo3vW995/5rt161a5cuUdO3ak\nfUQ0UwejrzhF2q7ZlL5xfqsmvSqVn9LwKavD0XbNJrvT2a5sqU9bNHI9+sVvUWabbUztLH8n\njFrNr/17DN+5p+P6LXans0qBfAf6dA2847Mabpo0aZLNZuvWrZvru4tnzpwpIkajcffu3WPH\njm3btq2/v3/NmjX37dvnSoqZ9vfx8dm6dev48ePbtm0bEBBQI9DvcL8eOnV2n4n20WoPPd99\n+M49TVes89fr6xYueLR/T222QwAAuGcD1xxNGvPi7LED30hUlSxXa/bXxwdH5uC75VRqn8OL\nXxv8zusfn4sNr1h11Gd7Jncu8aCOvOT4/nEvDB/eq41Jk+cL4YUOAAAgAElEQVTJum2/OTY9\nn04tBV/e9dG5lz94ocrr9gpV646e+XP9qc2H9Xvm/aeuTy4xZs+cGyM+fK/ltGt+eQtXrN1m\n27FZWpWs/OHznv3eebb2/ESro1ybsbNKfb5URET8sjlU8cC71JehWqd77867tH1UsdZzO7/8\n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\n69cvNjZ23rx5vXv3jouLCwkJGTt27MSJE3v06CEid20PCgpasGDB3LlzW7duLSIrVqxo06bN\n7NmzjUbjnj17Fi5c+N1332Uo9cSJE506dXJtQsDhfXddxamYmxfiEw716+4q+/seHUvO/TI+\n1ZL+1CMAAPAqin2Pnclkmjx58rJly+58KMFimbTv5w0d24jI9aTkVLu9yb+ZpkqBfE6n87Ip\nUUTizJb6RQun2Gw3zeasZsmmT9qrljqNRkScTnFNl2Cx9OnTx/WQ0Whcs2ZNSEjIjRs3TCZT\nly5d3G+3WCzPPPOMqz0yMtLpdEZHR4tIYGBg/fr1M7zqKiLx8fF169Y1m82xsbHurOK3qzd8\ndTpXqhORgv5+WrX6zM2bWW0FAADwOMUGu6FDh3bt2jUkJOTOh17YtrNnpXJ5fXxEJC41VUTS\n4oteozFoNadiYp0i8ampsw4dDZn5aaGPvyj3+eIfLlzMcJys+ujU6lalS3TfuO33G/+cjont\nsfGbGgULuE503TSbVSIbNmwoXbp0sWLF2rZte/r0aRGJjY1VqVTbtm2rWrWqO+3x8fEiEhAQ\ncKtsvV6v1585c0ZEqlSpMmDAgJ49e/6nVKczISFhzpw54eHhZcuWTb+crFZROiQoxWZLttpc\n3WLNqVaH4/j1f+77JwMAAHKLYl+K3b59uyvoZHDz5s2t5/6KfnWQ625CqkWrVqtVqrQOerXm\nZoo50WLRqlWlg4OWvvaSyWKZuO/ndms2XRo6KP0Lkdn0mdOsYfl5X9VYuEJE9BrNbwNuxaz4\nVItTpRrw+lgZMVqCgn5ateKpRo1k4zY5f05Ehr3zbg7aNZoCJ8/eXphG2/v3k1KkxK27sTdF\npMTJs+LrKyKSnCxq9c6gYNn63e9Fw6b36JpWalareLJA/gC9rvOGLRPr106x2kd+v1etUiX9\nm/MAAIAXUuwZuyeffNLf3//O9vHjx1cNyx/w7ym6AL3e7nA4XC+UioiIxWEPMuoD9Pq4Ea9M\nb/y0v15X0N9vTvOGGrVq/emz6Q+VVZ9kqy1ywdKBT1a6OGRg9KuDXq9TvdqXy12nBo1ajTid\nMuNDqVNXKlSUtyaKiOzfKwZDztr9/MThEKfjdjU2q/gHZLkdvr6y/QcZMkx8fMLCwtIvJ6tV\n6NTqX/v3VImq9aqNQ77bNazGk0atpoCf7z38LAAAwMOh2GD33nvv3dlot9u3bNkyvfHTaS15\n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\nAL1e/yVLQv+FrBTYxYdtuanNv71JSRFQo+eohR2/vZvQ0dc2sQqbNm1aunSpceVjx445OTmZ\n3Y/qSxQ283JxccnmLZDN8QJgC7AFsjkXFxdLWabPRyiLykrf2MU8vK1wriMCAIjlOYvbyc5G\nqTO4TERERESZRlYK7NTvNGK5m3HRXSYO1+oysDxEREREmUpWehUrd5bpNRHGxXCNPrf0UwJT\nm+kLPl+hPpqQgcdOkt1boE71DDx4xlefFwBbgC2Q7W8CZMWyUmDnWLioKuoM0ByAoA2/Ha/p\n7GRjzC1atGjbtm2Ni3q9XqlUZkApLbOxsRGJDG+SIQiCSpW9vnIRiUQ2NsnnS6fTaTSaDCzP\nlyeRSGSy5H7cGo1Gp8tej5xlMpnpV9sqlUoQstfvONObgF6vV6uz18ckYrFYLpcbF7VarVar\nzcDyfHlSqVQqTf61q1arM1tnhex2U7JKWSmws/Xo4CvqvvTss2+r5b6+fY40T7uidsnlr1Wr\nVq1atYyL4eHhsbGxGVFMi0x/q+n1+sxWvP+aRCIxDew0Gk12awGFQmEa2CmVyuwW3Ds6OpoG\ndrGxsdkwsDP+nA1vAlKp1DSw02g0cXFxGVieL8/W1tY0sEtISMhu/7+lLyArBXYikeKX6YOn\nzpzY5S9drvylx07tnNElIiIiIspEslJgB8DBp/bkhbUzuhREREREmVFW6hVLRERERGlgYEdE\nRERkJRjYEREREVkJBnZEREREVoKBHREREZGVYGBHREREZCUY2BERERFZCQZ2RERERFaCgR0R\nERGRlWBgR0RERGQlGNgRERERWQkGdkThWMDTAAAVGklEQVRERERWgoEdERERkZVgYEdERERk\nJRjYEREREVkJBnZEREREVoKBHREREZGVYGBHREREZCUY2BERERFZCQZ2RERERFaCgR0RERGR\nlWBgR0RERGQlGNgRERERWQkGdkRERERWgoEdERERkZVgYEdERERkJRjYEREREVkJBnZERERE\nVkIkCEJGl+E/ER4entmqtm7duqioKMPPTk5OPXr0yNjyfGHR0dFr1641LpYoUaJOnToZV5wM\nEBwcfOLECeNi48aNCxcunHHFyQCHDx9+8OCBcbFfv342NjYZWJ4vb8WKFUql0vCzp6dnhw4d\nMrY8X1hoaOjWrVuNi+XKlatatWoGlufLu3r16rlz54yLfn5+efLkycDymOXu7p7RRaD/izSj\n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\n6R6vtquR81K4vLuPo2mi3LHSnB/bBf01sXOnXkuORQ+b8auh+1hq1tEIZk+61K7EnDEdLgRM\n7da5y2+rrn47eUYOici79pjGhZ6M7NelS7f+B6JK/zyqLMw1gtkWAPCFG6Fs7ZyC2L510hiz\nzoXaCoKQp2XiANRmK2j2hJqVevNi9X5OT+MgK1whH7wPpPNKQFao7EdJfx3xxS/49LB054eF\nWjQo6jn5u34XYtQfvCSyw9mnL0aU1QeXypwSYhJsHT9lrC+zAkf2PN582uS6uT68qvXK/I3w\neU+6WZm/ETJQJmyc/+6SyISV/S9YXzU/yyVhfc1Cnxef2P0nPtfdXBCUsaHXVj5K6F01+z51\nzyqN8J9GdVmlETJEpm2c/+KSyLSV/bystZr/5yVhrc1Cnxef5WZqca9X9BnxT8X2Ywtnjwm7\nzGIjgI2QpmzVONmkstmkmh+LzULpwVexRERERFaCr2KJiIiIrAQDOyIiIiIrwcCOiIiIyEow\nsCMiIiKyEgzsiKzT4bp5REnEYqmLZ74WPUdfeav8r44naA4v/6159RLuznYKR1ffSg3HLNgR\nq0vumxXYNJ8oFYnMNY1dnvuumFgsfaTUGVPOf1dcJBKNfRRlTAm70l0kEv14/93Hllcdc14k\nEm0Ii//YDYmIMjMOd0JktRSuTXZtGAZA0Kle3buyZPrM6r6nTz09WdHhM88dLugTxrUqOe1Q\nSMv+w+cNreAoir96Zs/8Hzus2dz/+gl/T1nifyAVOert2jTKdEORKK2SFBlYXVh6Z8HzmHlf\nJc6qvnrvcwD7ltyfPL2CIeXRqmsise3IfE6ft0ZERFkUAzsiqyWV52ncuHHiQrNW3fv6VfSu\n0rH7nse72n3eA12cWH/aoTfzTjwcXCNxblm/Dl2H9GletGLvOgNa3FrRwpAokedKLk865Phq\nlES08syWpxibA4A24d7KkLi6db0ub9iEpMAucN8LB+/+3nK+fCAiAvgqlij7kDuWXTu21PMD\nAyK0n3P0Sr32bcdZl3y/3WOM6gxcS/c4MK7M3YBut+K1n7ZnqW2Rrp52T9b/bViMuDVJL3VZ\nPqdl7Ks/n6h0ACBoFr2Kzd200/9XAyIi68HAjigbKdCtpU7zdl1oHAD1u6vDOtXP4+oklSty\nf1VhxMJjAC6O+NrO3c+4fnxogEgkmvssJo19xjyf+Uyp/WFcpdRZJQdO0Gujp9yO+OQC96nj\nFf10vuHnW7POO+Ubna/4BIVI/cftSADxYZteq3WVf/gKgF7zdu6Izr65XOW2zr7lm8zeftO4\nkzSyDLQJ97oUd81dd8Rbrf6Ti0pElBkwsCPKRuSOlQBcj9UA+L1WwzU3PGet3332xOEJ3fLN\nHVJ/eUhcydHDE8L3LA+JM6x//Y8Zdh7th/s4prHPmEfXALRxt0udpXBrYSMWPb6cGNjFha5L\n0Xli9svYtAtcdFgFTfztA5FKAIuDXn31bVOJPM/QXI6nZgYDePvPepFI/JOvC4BpjUtP3Bk1\nbP7aE0d3jGydb1zH0gN3PTXsJI0sANr4O13LVj6Tq9+/R2e7S3lLJKKsjd/YEWUrIuNf7l1/\n/Kvr4E4+DgAqVakw8Pedx6NU/Xz7tPcYvGDWrX6zKkLQ/hjwoNRvmz+wS8G4SzOHE4sgJL35\nTd15wtf9A3Oiu5UcCWxeFhzZsMyrrW8TpnXJD6BDz4ILli4Cat9bfNfWvV0JO2lcyLKxx1/t\nDH3Q2sMWQLUa9X3uHGs/cNai1gstZc290xWAJja4U7WGZ1z63js83VlioRJERFkHAzuibEQd\nexlAaXsZgKGjhpzat3vWurtPnz65dTlIlzRt9NhBRavN/xWz9kfenfh3LP7u+1Xa+3Qs9DVw\nZHd4wvfe9imyVO8CE3RC3oqJY5p8bOcJADKHCi3dbIP/evD2u/liea7BuRwBFO7bKmHKH3/H\nqDdeCvOs0h9A9KOdANp4vvfUUO5wNs2srgB+r1o7wVEa8+iGWi+AgR0RZX1870CUjTzdskcs\nc+3uaa/XhLQpmrvN2NWRgkvVRh1mrL+oECeGNb4DxyVEHPjrddzJH9e7lZxayVGe9j4d84zK\nZSNZNPVy6qzbSyaIJXa/f+32/5T5h0oeISd2Xp9+OUehX2zFAODoM9JDJp58NnhDaHzpESUA\nyBzsRSLJq4jIdybCXp5KOwuAZwf/x1eO5Yw70Wh00P9TSCKizEIgImt0qE5uB69+pinq2H/L\nOcjztdwqCMLb4K4AHiRoDVla1XOJSNT1Trhhsb+3Q7Ef9uaxkfY4+So9xzr9UwWxxNH/71DT\nxIh/1+eUS3z77DMsHm3iY+/Z/RMq8jywpVjqVNPZptpft42J84q6OhepAiAoUikIgjIySCIS\n/XI1zLhCQKf6jXoeSiNLFX0OwPrQOEEQ7qxsKxLbrHwU9QnFIyLKVBjYEVmnQ3Vy27o2DQwM\nDAwMPHrkwNpFk2rkcVC4VL4QrRYEIfaVv0Qk6vvn7tv37545vLFr9Xw2YlHdteejtXpBEG7O\nryIS20htC73T6tNzLL02ZmQjH7HEsf2giZt27tu/a8ukEd1dZWL3sn3fqHWGdT45sFNGHjX8\nL3Txq1hj4i3/qgBsnKsbU5a2zi93KjNzxZbzf5/2/7mtSGw7+9rbNLJMAztB0A4p7uqU/5sE\n3ScUkIgoE2FgR2SdDtXJbXwwLxKJndzzNO0+8nJognGFUwtGlMiXU2HvXq5mq40XXi9uW0ou\ntRnzOEoQBOW7Y2KRqHDnwx9xPL1y3+JxjSsXdXGwsXPNVa5avREz1kabxIWfHNgJglDD2UZq\nW1hjEmTGvv4LQK4a25OPr4mcO7xjQQ8nma2zb9lGf+65n3bW+4GdEPtqq4NEXH/21U8rIRFR\nJiEShM85VCkRWYGEt9vsPTvOfRo1NG9aA50QEVFmw16xRGRC0CjV8QHf/WSXswujOiKiLIeB\nHREli3+71d6zm1jq9Mex2cbEd/d/atrzjNn1JTL3M6f2fvLh/rs9ExFlT3wVS0Qm9Ak3LlyS\nFahYzOsDQwcTEVEmxMCOiIiIyEpwgGIiIiIiK8HAjoiIiMhKMLAjIiIishIM7IiIiIisBAM7\nIiIiIivBwI6I/tduHcgAAAAADPK3vsdXFAEwIXYAABMBuKbi7rGKL3sAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Lets see Total ride length/time of member vs casual by each day\n",
    "\n",
    "Bike_Data %>%\n",
    "group_by(member_casual,Day_OF_Week) %>%\n",
    "summarise(AVG_ride_length=mean(ride_length),.groups =\"drop\")%>% arrange(member_casual,Day_OF_Week)%>%\n",
    "ggplot(aes(x = Day_OF_Week, y = AVG_ride_length,,fill=member_casual))+\n",
    " geom_col(,width=.98, position = position_dodge(width=.98)) +\n",
    "  labs(title = \"Average distance traveled by Members and Casual riders\")+\n",
    "geom_text(aes(label = AVG_ride_length, y =AVG_ride_length), size = 3)+theme(text = element_text(size = 9),element_line(size =1))\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "41c5ec46",
   "metadata": {
    "papermill": {
     "duration": 0.013969,
     "end_time": "2022-11-19T00:07:17.018376",
     "exception": false,
     "start_time": "2022-11-19T00:07:17.004407",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> By observing above graph we can see that ride duration is more for casual rider through the week however for member ride durtation is more on weekend."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "c8f84255",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:07:17.048860Z",
     "iopub.status.busy": "2022-11-19T00:07:17.047209Z",
     "iopub.status.idle": "2022-11-19T00:07:17.532572Z",
     "shell.execute_reply": "2022-11-19T00:07:17.529575Z"
    },
    "papermill": {
     "duration": 0.504003,
     "end_time": "2022-11-19T00:07:17.535667",
     "exception": false,
     "start_time": "2022-11-19T00:07:17.031664",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nJNs5vaMwY6bPvLi5QIyZbr05XhpZyMGKE5E83HKcmrUcr1YHJd0HFYNFRBTDzYd7dXm7wain\nfvp20l9jv2j211uzRCT0g97Zdpvay0OrzBu9Z/hvlxc2K3r08/dFpM07TdOP5opVmV4W8+ts\nAem3EzfuKbnZDB7tUfqNt//6571d0rJzhiPE31g7+OVXFEU5+sIQjTXnYFHcpN7xWBCnlk+2\n0q+yFBoXYC6/AnK+WIAMufuQoTslRu+zGhRFMe6KTHsKKSFih1FRROS7W5dWRF/8REQCyr2p\nqurECgUUg3l7xK1P2RODzUajpVDWB9Edx+FD5x9N0/50YW8ReXXh7tSNEafGyK3TColRe0XE\n6h+a5oMRZ96UlFOx2mpI78bxV0WkQMXp6Qc187dK5qdi00iOvfzz128Hm42Koiy4EqtmdE4z\n2zl1cJxgenDuoTSTSDnBFHP5KxHxKTYkzQhJsYe+/fbb7388keOlkWHZOV5xDrnfcu44o6Tt\nI9pXaxqOU5Ojj4enaT/7czsRKd1xo+Ot42ys1T/UZk9s4GsxmgueTXUnRIZSn4pVb91vUaTR\nfFVV+xXxNlqKXr91ZveOU7Ha5jfDbcZxKrbv0TtuLczwVGxW86t5W8psO0kj/Z6SXl7tKTne\nDFRVjb74uaIoRnPQ7+n+PDoc+qS5iHgX7uVUzalluCgyPBWbEPm7pDoVq3FaGk/Fplllqf/Q\naV2AufsKSEPLFgJk4b5+jt2ZlcMS7KpfqRGNfNOeQrL4PfhycR8RmTrriKPFu+iAJ4I8I069\ns/vSrkknwgOrTG7qd+tTinlUpQBb4pUxv1+5sxv7kFrlihYt+kPmv6io2iK+uxJrspac1v2B\n1O2RRw+mvDb71Okc5JUQsf2zc3ecOvlz6ne33+S0Bt/irwaaDeEn3lh/5whh/07ZlvmvsMde\n+bZChQo1G72W0mL0LPRIzzdmViigqur6jH4YW8ucauQV3L26tznmv7lrrsWlbj+56IVnn332\n9cXnc7NGNNI+O3m85Wj7SM5Wa4olI39K0/mMl3aIyEMjqjreO87GJkRsf2vziD+iEos0mVnC\nakzXTVY8g57qUcjr6t6R566sm3cpplD99wJNGR0Ycf2qlKznN3cFuHdPyc1m4F2037sNCtmS\nrnVsOzbSlvaHw5LjDvcevktEHhgzSmPNTi2KmMt3vL3wy5SU13m4fLKldQHmYiPJwRYCZMO9\n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\n+3vJokWLFi7c9Pc5EclZJ27EETsg9zhidw/hiN39gCN2EI1H7NLzLVGr/8ipG/86e+ngr9PH\nDsrbmgAAAJADWn95IjOFqzQZOqlJnpQCAACA3MjhETsAAADcbQh2AAAAOkGwAwAA0AmCHQAA\ngE4Q7AAAAHSCYAcAAKATBDsAAACdINgB+H979x5g5Zg4cPw5c79UU81EVKJCVAr5yVqyYUtL\n4Re5Jff7XXKNVOu6yiW3jSwtsdZqV2SXdWctLbs2ueyybRSpptKUuZ7z+2Mysr/MTqk509Pn\n89c573ve53ne4dR33nMJgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASGQ1zjSp\n6iWPT7p7xmt/W1yesUWHbQcNO63/zm1DCCEkX3j4jideeuuT5Zk7dN/9uHOO3yY/8+uDvmvX\n2m4HANgkNNIVuz9cM+KXL3x+4HHnXD/24n6dK+4YfeZvPykLIXz82BUTHvnTHoeefNV5xxZ8\n9OzlF0xKfX3Id+1a2+0AAJuIxrhiV1PxyV1/WdT3mp8N7tYqhLBt1x6fvTH0t3e9P3jcTuMf\nea/LsPFD9tsmhNDl+nDY8BunfjbsqC0KQ6pyzbvaZq/d9i0KG+EEAQCagsa4YldTPqfjNtsM\n7NT86w2JnYtyK5eVVSx7aW55zQH9tqzdmttqr57Nct58cUEI4bt2re32Rjg7AIAmojGu2OUU\n7XXzzXvV3a0qe3/y/LKtT+5SueJXIYQdC75ZQ7eCrD/MWhZCqFzxzhp3Ve61dttXX8YPf/jD\n8vLy2tuDBw8eNWrU+jzJhqlo/ClhgykpKUn3ElhrrVu3TvcS2CAWLVqU7iXQJDTShyfqzHnz\nydtuva+608DL9m9XNWdFCKEk+5uPOJRkZ1Z9WRVCSFasedfabt/g5wMA0GQ0XthVLHl/8i23\nPf230r5DTv/pUf3yEonluQUhhNKqZNucVa8IL6qqyWqVFULI+I5da7t99QWMGTMmmUzW3m7T\nps3y5cs38BmvQU7jTwkbTFqeRKybrKys/Pz8EEJZWVkq5aNlEK1GCrvl/3r2wotuz9zpgBsm\nHbt9SV7txuyCHiG8+P5XVW1zcmu3fPhVdVG3onp2re321dfQr1+/utvl5eVlZWUb8ozXTNgR\nk4oKby7YaKRSqdqwq6ysrPsVF4hPY3x4IpVc+dNL78zd9+w7rjylrupCCHktf9QuJ/Op1xbW\n3q0qe2vm8spdftS2nl1ru70Rzg4AoIlojCt2Kz+fMntl1Yk7Ff5l5sy6jdn52/bsVnThkK4X\n3Tv6uc1Hdm1Z8dvbxhe223/YloUhhJDI/q5da7sdAGATkWiEN1vMf/7S0ya8+x8bizqNmnLz\nbiFV88wDNz/yzBuLyxOde/Y97cKTu9R9svW7dq3t9jVJ10uxzW8c0/iTwgay/KIr070EGion\nJ6dFixYhhNLSUi/FxsoH1QmNE3ZNkLCD70/YbUSE3aZA2BEa7Z8UAwBgQxN2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACRyEr3AgBCm1kfpHsJsN4s7L59upfApssVOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEhkpXsB6ZGRkVFYWJju\nVcDGzZMI1igtT40VK1Y0/qQ0QZto2IUQEolEupcAGzdPIlgjTw3SaBMNu2QyWVZW1vjzNm/8\nKWGDScuTCJo+Tw3SyHvsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewA\nACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewA\nACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIpGV\n7gWsR8kXHr7jiZfe+mR55g7ddz/unOO3yc9M95IAABpPPFfsPn7sigmP/GmPQ0++6rxjCz56\n9vILJqXSvSQAgMYUS9ilKsc/8l6XYeOG7LdHt133Ou/6M8vmPTX1sxXpXhYAQOOJJOwqlr00\nt7zmgH5b1t7NbbVXz2Y5b764IL2rAgBoTJG8x65yxTshhB0LvjmdbgVZf5i1bPXHzJw5M5lM\n1t4uKipq27ZtY64Q4pOdnZ3uJUBTlJanRlVVVeNPShMUSdglK1aEEEqyv/m0REl2ZtWX3/q/\n/LzzzisvL6+9PXjw4FGjRjXmCmtVNP6UsMEUFRWlewnQFKXlqbFo0aLGn5QmKJKwy8gtCCGU\nViXb5qx6cXlRVU1WqyZ3drnX35ruJUBTlNpnz3QvASAGTS591k12QY8QXnz/q6q2Obm1Wz78\nqrqo27d+Z5oxY0YqteqTsslkcvHixY29Sja8/Pz8goKCZDK5ZMmSdK8FmpCcnJzmzZuHEEpL\nS+v+JATiE0nY5bX8UbucO596beE+B7QPIVSVvTVzeeWQH33rXXS1f6jVKi8vLysra+xVsuHV\n/Y3lry5Y3erPCM8OiFgkn4oNiewLh3T9x72jn3vrw/kf//2eUeML2+0/bMvCdC8LAKDxRHLF\nLoTQZei4Mypufmj8qMXlic49+4698OREupcEANCYEpvmNXkvxcYqPz+/sLAwmUyWlpamey3Q\nhOTk5LRo0SKEUFpaWvfFT0SmpKQk3Usg/WJ5KRYAYJMn7AAAIiHsAAAiIewAACIh7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nkZXuBcD6NH/+/IULF2ZlZXXq1Cnda4EmZMmSJbNmzQohdO7cOTMzM93LATaUTTTs8vLy8vLy\n0r0K1r/p06dPnDixTZs2M2bMSPdaoAn54IMPzj333BDCs88+27Jly3QvB9hQvBQLABAJYQcA\nEAlhBwAQiU30PXbEap999mnfvn1ubm66FwJNy/bbb3/dddeFEAoKCtK9FmADSqRSqXSvAQCA\n9cBLsQAAkRB2AACREHbwjSGDB986vyzdq4DGU7H0mUGDBn1RlUz3QoD1Q9gBAERC2AE0ccma\n7/Uht+95eH1SNeUbamhgnfi6E5qimvK5UyZOfn3W+4vKc3bo3e+Us4Z1yMsMIVQunX3vHVP+\n9M5HX1YmS7bsMuCos4f8oF0I4Yu3Ztz1y+nvf/JZRmFxz70POuu4g/IzEiFVNWjw/x4z+ZHD\nS/Jrhz3qkMF9bn/wnC2bfdc40KQMP/Tg/UedOXPC3f9aVlO0eeejR4zqNPex8Q88s6A8o/Mu\n/a686ITmmYkQQrJ68WOT7v79a++UVmS069zz4OGn7Nu1VcMPDyGsmP+nUePve2/ukmZttxkw\n9Iwj9ulUz7AhhKMOGXzUz+9ZMPnmF2blT5lyRZp+PMAauGJH05Oqvu3ckc98Ujj83KvGXXZ6\ni49+f8nIB2v33DdyzGulHc4ZNW789WMH9UxOuXHEoupk9cp3zx5zV0bvwVdd+7ORpx4y+8nJ\n434/r/4Z1jjOhj8xWGvTrp024Jxxd912/R65n915ydnXvhLOHXPTNSOO+Pfrv7vpjYW1j5ly\nyXnTZmcec+7lN467bMD2qVsvOfUP81c2/PAQwtiL7+9+0Injxl1+YLesqRPOf/CDZfUPG0J4\n9bYxhbsecu2NZzbiDwP471yxo8lZ/ul9z39e/dOp53cvyAohbD1u6egbX1xWkyrKTGw+4PCz\n9z2wd1FOCKF928PueWLsnPLqHVe+9VUyNXBg3+1b5oYuncZe2uqz/Gb1T7HGcUqa5TTC2cFa\n6XzSZQN6twshHH7Ktk9f8fZVlw7vmJsZtt5yUPGDf35vWdhjs/LF037zjy+vmXpht4KsEELn\n7bpXv3H0w3fO/vHY3g05vHaWTmeOGbpX2xBC1267lL171FO3vvS/Y2rqGTaEsGzzk4/Yb6d0\n/EiA+gg7mpzFf34vu9nOtVUXQsgrPuC66w6ovT344AHv/PnV38ydt2DBgo9nv1m7Mb94cN8u\nz4w54aTuu+684w479Nq1z24dW9Y/xRrHgSao5Q4tam9kNcvKyG7TMTez9m7zzERIpkIIZZ++\nnUqlLj3i0NWPKqz+NITeDTm81kG7FNfd3me/tk88+krZp3n1DBtC2GLfDuvvLIH1RtjR5CSr\nUomMNVw8S1YtGnv6mf9o1q3/nr267bbD/oP6XnDOmBBCIrPFhePvP2z2X/42a/bsd/742P13\n9zh09Ojhvf7fAKnqVH3jQJO3hjfPZBXmJDILH/3VA4nVNiYSmQ08fA0DNstKJLL/67AFzf31\nAU2R99jR5BTvtnXl8pn/LK+pvVux9Pnhw4f/fWVV2af3vrWwauJNo4YdNmjvPXbt0GrVF84t\nmTXtnsm/2WrH3gcdfuzFo382/qQu7zz5i7rRyqpXXZYoX/Ji+aorHGseBzZGBZv3D8mVTy2s\nyl4la8qYK2574fO1GuTJv5bW3X7hiXmF7fqtl2GBxudXLpqcFp1O/Z+Wr149auI5xw5snfXl\nE3feU1Wwd4+C7K+ab5tKvTrt5VkDu29WOvfdX0+eEkKY+/nS7Vqu+N20R1a2LO7fa5vEys+n\nPz2/sP2hIYSQyN6+IPvl23/d97QBWcs/efi2nycSiRBC9neMs0uXzdJ63rAucpr3PqlX8f0X\nj807ZUjXds3++szkJ95bPPqSNms1yJsTRj1WdVLPLfL+/twjj35SfvLtu+c0L/z+wwKNT9jR\n5CQy8kbeNm7yxCmTfjZqWbKgS88fX3PG0SGE/JJDRx/3xaQHrp++MnPrbXsedentRTedNWXk\n2b2nPjT6hLJfPHnv8w+UFbZq06VH/2vOOKR2qCuuPuWG2x69+MzHKpOpHfc/vc+ye+sfJ52n\nDevqwCsnVPx84qN3Xb+kKrvdNjtdcO3lPQuzG354Rlar0Sfuef/UiQ8tqtxym22Pv3zige0L\nv/+wQFokUqkN9s2V0DSkUpVLy0Kr5j70CkDkhB0AQCR8eAIAIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg5Yg4LMjG2PfCndq0i/CZ1bFRQfmO5VADSUsAMAiISwAwCIhLCDJi9VWVG9\nXv+FmPU+YL2S1UtrGm0ygE2bsIMm6uEdSoo6Xvnmzy9oX9QsPyez5WadjrnsgWQIM39x8c5b\nb56f22ybHXcfPXX26oeU/ful847ov1WblrmFrbvu3O/qu59Kfr8B3/n1tX17dCzMyS1p1/XI\nc2+aV1nTwOnu2764VecJFUvfOGafHZvlti6raVBHfvbqg4fv37u4eV5BUZs+Bxz96JsL63a9\n97vbD95nl5Kiwqyc/C067zR85K2lq7VpsmrR7ZecsFPntnnZ2S2KO+w79JzXF5XX7hrZoUWL\nDiNXn+WvV++aSCTmVNQ0cHCAjUkKaJKmdi3OyuuUk93q+IvG3HXr9QO7tgwh9B66d35J78uv\nuXX82PM75mUlMvNfXlZR+/iyeY93zs/OLtj6uDNHjLvq4sP6dgoh9Dr2vnUbMD8jUbRd38yM\n7P5DTxp1+fmDftghhFDS69SVNamGTDd5u9YttrpiaMdW+x1zzoSJd1Yk//v5fvby2MLMjILN\ndz/twiuvHHlW9+K8jOzW93y8LJVKzZ1+RkYi0bLrPiMuv/qaq0cd8+NuIYRtj55ed+xN+7VL\nJDL7HXH6mGuuGXHaoc0yMwq3GFyZTKVSqYvaN2/e/qLVJ3p79C4hhH+VV9ferX/w8Z1a5rf+\nyVr+pwNIG2EHTdTUrsUhhBF/nFd796vF00MImblbvrKkvHbLPx/qF0I4/N1FtXdHdyvOLtjh\ntUVf1Y3w+AW9QgjjPlq6DgPmZyRCCBf+5oNVYyWrJp/WPYRw6G/nNGS6ydu1TiQS/W/7S0PP\nNlmxX6u8/OIB75VVfr28F1pnZ7TtMzWVSt3frSQrb6t/f51iqVTq/HbN84sPqr1dtfKDjERi\nqwMeq9v72kU/KCkpefiLlakGhF39gws7YOPipVhourILut7Yb8va23mtf9I8M6Ok+817tsyt\n3dLmB3uFEL6qSoYQqle+O3Z2adfT79+jOK/u8IFX3hJCeOTOD9dhwBBCsy1O+dkh2606MpE1\nbMLjBZkZL1/5QkOnS+Q+cGqvBp7p8nkTnl1SvusNt3QtzP56eX2n3Tlx1IklIYQhr3ywYP7s\nrXIza3elkisqUqlUzcpV82Tk5yTC0vd+M/OT5bVb9rjh1YULFw5tk9+QqesfHGDjkpXuBQDf\nKSOrePW7WYmQ26ZV3d1ERnbd7fLSGTWp1N9v+p/ETf85yLK/L1uHAUMIrXoM+daD87r8pHXe\nUwteDmF4Q6bLadZrs+yG/ur45T+eDyHs2W/z1TfudeLpe4UQQiho2br0zafvf/qldz/86N9z\n57z3zt/mLa3Ia7nqYZm5HX5/7bADL/vl/3Sc2rH77j/o02fvfv0PG/Lj1lmJhkxd/+AAGxdh\nB1HIyAkh9Bg5ue6CXJ3cooZeNvsP/z+LshIhkZHbwOkSGYUNnytZkQwh5CTWnGKPXbjvYROe\nb7dzv4N+1OfAPQdcOKbnvFP2P+uLbx6w98j7vzju0mnTpr/w0iuvPvOLhyZNuOD8PtNmPb//\nahcU66SS3/pgxH8dHGAjIuwgBnmtB2Ymzqteun3//j+o21j91fuP/e5vbXsWrNuYpbOmhbB/\n3d2aijlPLC5vsce+G2K6FtvtEsIzr76xKHRsUbfxuYtPn7K41d0TBg2d8HyHgXf9e/opdbvu\nW+3YqrIP3np3aXHPXY84ZcQRp4wIIbw3Y+yOA68894q3Z9+5R+3aV59rwczSutuVy1+vf3CA\njYv32EEMsvK6jN6x9T+mDP/j59+8OWzqmYOPPPLIuev6LC+bf8dlT3789b2ah0YMLqtJDr5h\nzw0xXYuOl/ZslvPnc0b8q3xVhFUu+9Oxt0ya/sZm1Svfr0mlWvfate7BKz977aZ5y0NYdeFt\nxYI7+/Tpc/h1b9c9YOveu4UQqldUhxAKMjPKS59c9PUbB8sXv37Gc/PqHvlfBwfYuLhiB5E4\n76k7Jm139AGdux9yxKBdt20967lHpjzzYY/jpgzbbB2v2OW2ybtu0I6zjj5ht87N337+V4+/\nOKdD/7G377H5hpgukVn021+ese0ht/To0vf4Y/q3zV76+KS7PqspvP3XxxW0yduv+Iznbzzw\nrOwRu7Yv+Pjd1++563ed2+ZVfvLWrQ8+euKRQ4q2vnq/Nj//49i9B358fJ9unZJL50y7Z3Jm\ndvHoa3YOIQwatt3V497s2e/Ykcf0q/r8/V+Mv2VBSU74tLp23oI2R9Q/+Lr96ADSJt0fywXW\nbGrX4twWe66+pVVWxlYDnqm7++XccSGEg/76Rd2WpR88ferBfdu2bJZT0Lprrx9eNWlGVXId\nB8zPSOz94Fv3XHVyr23a5mXltNmqxwlXTFpW/a3vo6tnusnbtc5rue/anvI/Z9w1aK/uLQqy\ncwtb7dJv6JTXPqvdXjb32eEDdm9XXNiibad9fnLME++WLpx5w9atCnKatfm0ojqVSq38/NWz\nh+63VUmLrIzM5sXt+x584uNvr/oWmGTNiokXHLl9x7bZiUQIod2ex77y2gFhta87qX9wX3cC\nbFwSqZRXHID4JSu+/HRh9VbtW6d7IQAbkLADAIiE99gBG9acxw/c+YRX63lAblHfz+dMa7T1\nAETMFTsAgEj4uhMAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEj8HzCM2WlJJlXFAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Visualising riding behaviour of member and casual by ride distance\n",
    "\n",
    "Bike_Data %>%\n",
    "group_by(member_casual) %>%\n",
    "summarise(AVG_ride_length=mean(ride_length))%>% arrange(member_casual)%>%\n",
    "ggplot(aes(x=member_casual,y=AVG_ride_length,fill =member_casual))+\n",
    "geom_col(position='dodge')+\n",
    "  labs(title = \"Average distance traveled by Members and Casual riders\")\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "abdf4995",
   "metadata": {
    "papermill": {
     "duration": 0.014087,
     "end_time": "2022-11-19T00:07:17.563687",
     "exception": false,
     "start_time": "2022-11-19T00:07:17.549600",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> This graph validates the above graph that a causal rider traveling more distance than a member\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "c0985021",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-11-19T00:07:17.595343Z",
     "iopub.status.busy": "2022-11-19T00:07:17.593739Z",
     "iopub.status.idle": "2022-11-19T00:07:20.593660Z",
     "shell.execute_reply": "2022-11-19T00:07:20.590924Z"
    },
    "papermill": {
     "duration": 3.019495,
     "end_time": "2022-11-19T00:07:20.597034",
     "exception": false,
     "start_time": "2022-11-19T00:07:17.577539",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\njtiT3076YvXWfZfjzcXL1Xz0uZf+r4R/KlXniMKvcb9nnfawH7+csnzTrvBYc2jp6h26P/9A\nhbwJfc5uW/b5Nz/vP37K7BtUvVG7Pj3aeZtN7qrOoMJN1rzt8nkvX71bnUpIOrn0f97BHRs9\nsf/bj2c7XA0tJkWfWeh0uVrUzCfJXS2pzNnd/nU3VIrvSSqbyORfBmf8ha8/HPbL9oNmn/z1\nWz798mMNUv+jfvzh9o9/8dWZaePW7PaeNeut7LDH76Ibqkv+VWw22V+pS+2z2s1Up/TovCQ8\nRosGPrrm/76f9aq7XX/DO5NzdzFyFr5cyCjPtK96ftunTw94d+YPS3YeOB7nksWrzD333JOe\n1/785sjiHfp+OmVynw4VVn47Yu7ZaJc97J2+wzaH5e356jtv9ukavmLcorArCZ2nD3p/U3jR\nl4d+MHbksIeqO2eNHnje7izWqXXsxV+2R8Yn9Nn+1ebAMs9k+MeB2fOZmkEbZuxPXHTFTdt+\n/r7uyU9VcX3e/7Ule109X3lr5NsDq3v98/HAV/ZfsburWlLOKDwdZr3+yoK9lif7DRn9wZst\ny7smvP7Civ+iJdmj9/R9/3PzPe3fGfHxoBce3rtk2gfLT6ZStTKs8HvvLxh9boHDJUm/rj0T\n2rpBvqqPOmJPLg6PkXR61T6rV4lGAZ7uakl9znKzf1McKsX3RNnpl+HPD4aa6nT6eOKnvR+u\nsGrOiO/PX0nzJRsnvu9b++ERo3tnnz1+G5zx5/Zdz3l9dck7Z5/9lbrUP6tTnOqzX81+LsSv\nWJuP5nw9MPXBk96ZnLKLYQAcscso5R97d2Kl9b9u2Lx91Xc/zJxi8QqsWrdhp+5PVQtO+4C8\nb/2B3R+sLqloh1dDv12//1zMuX8n/R3jNXbkgFJeFknlK3p3eXJ4QueCLTv3faDtPQEekoqE\nPPrV4mH/xtjvyduqtt/UOWtP12xT1GkP+2r/xQYjM+NWmRW63RfW/8sY5z1eZlPEiW//M4U+\nEeo35era6LNzl5+IfGX6m/cHeUkqW7nSnsefmrLo2CddSqVYtQr4nNuWMwpPXUzYgp8OXv5w\nzoDKPlZJpctVsW95Yu5nex8cdk9c5LYrTlfr1o3LB3qqTKlhb+Q95e13btsEd1Urwwov/GBt\nxw8//HYpton32V8uxD7TuKDVp3ijAM81K/7r8Fip7ZvO+RfvbXJfS412S1OZs1LavzGWFSkO\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Visualising bike usage pattern by member\n",
    "\n",
    "Bike_Data %>% filter(member_casual ==\"member\")%>%\n",
    "group_by(Day_OF_Week,rideable_type) %>%\n",
    "summarise(N= n(),.groups =\"drop\")%>% mutate(percent =N*100/sum(N))%>%\n",
    "ggplot(aes(x=Day_OF_Week,y=N,fill =rideable_type),)+geom_bar(stat = 'identity')+\n",
    "  labs(title = \"Bike usage pattern by member\")+\n",
    "geom_text(aes(label =N , y =N), size = 3)\n",
    "\n",
    "#N=Number_of_rides\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "dcb9bfaa",
   "metadata": {
    "papermill": {
     "duration": 0.01541,
     "end_time": "2022-11-19T00:07:20.627985",
     "exception": false,
     "start_time": "2022-11-19T00:07:20.612575",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> By observing the above graph we can see that usage of the classic bike is more than electric bikes by member riders.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3a088fba",
   "metadata": {
    "papermill": {
     "duration": 0.015071,
     "end_time": "2022-11-19T00:07:20.658588",
     "exception": false,
     "start_time": "2022-11-19T00:07:20.643517",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Share -5"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cdd804ea",
   "metadata": {
    "papermill": {
     "duration": 0.014894,
     "end_time": "2022-11-19T00:07:20.687858",
     "exception": false,
     "start_time": "2022-11-19T00:07:20.672964",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Shared the presentation of how annual members and casual riders use Cyclistic bikes differently.\n",
    "**\n",
    "\n",
    "> Key tasks\n",
    "> 1. Determine the best way to share your findings.\n",
    "2. Create effective data visualizations.\n",
    "3. Present your findings.\n",
    "4. Ensure your work is accessible.\n",
    "\n",
    "**Deliverable\n",
    "**\n",
    "Supporting visualizations and key findings"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "748b3c7f",
   "metadata": {
    "papermill": {
     "duration": 0.014625,
     "end_time": "2022-11-19T00:07:20.716978",
     "exception": false,
     "start_time": "2022-11-19T00:07:20.702353",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## ACT -6"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8b854095",
   "metadata": {
    "papermill": {
     "duration": 0.014533,
     "end_time": "2022-11-19T00:07:20.746071",
     "exception": false,
     "start_time": "2022-11-19T00:07:20.731538",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "This phase will be carried out by the executive team, Director of Marketing (Lily Moreno) and the Marketing Analytics team based on my analysis.\n",
    "\n",
    "**Conclusion**\n",
    "\n",
    "* Member riders are active throughout the week although casual rides are active mostly on weekends.\n",
    "* Member riders are taking rides throughout the year although they are more active in June, July & August, casual riders take more rides in August as compared to member.\n",
    "* Casual rider riding more distance.\n",
    "* Casual rider spending more time.\n",
    "\n",
    "> There might be a reason behind this that member use bikes for work purposes, bike usage are higher in colder months, where there is a significant drop in casual members in those months.\n",
    "\n",
    "\n",
    "**Deliverable**\n",
    "\n",
    "> Top three recommendations based on the analysis.\n",
    " \n",
    "* Various coupons and discounts could be handed out along with the annual subscription or weekend-only membership targeting casual riders.  \n",
    "* Can host fun biking competitions with prizes at intervals for members on the weekends. Since there are lot of casual riders on weekends,this will also attract them to get a membership. \n",
    "* Create marketing campaigns which can be sent via email, or advertisement in the docking stations explaining why annual membership is beneficial. Campaigns should be placed at the peak months of the year targeting casual riders. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "83981500",
   "metadata": {
    "papermill": {
     "duration": 0.01475,
     "end_time": "2022-11-19T00:07:20.775114",
     "exception": false,
     "start_time": "2022-11-19T00:07:20.760364",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Resources\n",
    "\n",
    "[RDocumentation](http://www.rdocumentation.org)\n",
    "\n",
    "[RStudio](http://community.rstudio.com) and [Kaggle](http://www.kaggle.com/discussion) community.\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f9ef3d06",
   "metadata": {
    "papermill": {
     "duration": 0.014677,
     "end_time": "2022-11-19T00:07:20.804284",
     "exception": false,
     "start_time": "2022-11-19T00:07:20.789607",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**> Thanks for reading and I hope you like it. Please give your valuable feedback.**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1cba02b7",
   "metadata": {
    "papermill": {
     "duration": 0.014943,
     "end_time": "2022-11-19T00:07:20.833862",
     "exception": false,
     "start_time": "2022-11-19T00:07:20.818919",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> For the Kaggle Notebook access and to check detailed analysis with proper output details of the code please visit my [Notebook](http://https://www.kaggle.com/code/syedamanullah1/cyclist-bike-share-google-case-study-with-r#Introduction)."
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 274.728466,
   "end_time": "2022-11-19T00:07:21.271038",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-11-19T00:02:46.542572",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
