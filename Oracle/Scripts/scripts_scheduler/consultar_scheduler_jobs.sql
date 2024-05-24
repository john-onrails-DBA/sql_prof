SELECT      OWNER, 
            JOB_NAME, 
            JOB_TYPE, 
            JOB_ACTION, 
            REPEAT_INTERVAL,
            TO_CHAR(START_DATE, 'dd/mm/yyyy hh24:mi:ss TZR') START_DATE,
            to_char(last_start_date, 'dd/mm/yyyy hh24:mi:ss TZR') last_start_date, 
            LAST_RUN_DURATION, 
            to_char(next_run_date, 'dd/mm/yyyy hh24:mi:ss TZR') next_run_date, 
            STATE, 
            ENABLED, 
            run_count, 
            failure_count
FROM        dba_scheduler_jobs;