SELECT      WINDOW_NAME, 
            schedule_owner,
            schedule_name,
            SCHEDULE_TYPE, 
            REPEAT_INTERVAL,
            DURATION,
            WINDOW_PRIORITY,
            NEXT_START_DATE, 
            LAST_START_DATE,
            ENABLED, 
            comments
FROM        DBA_SCHEDULER_WINDOWS;