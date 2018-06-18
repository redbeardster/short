%% coding: utf-8
%% app generated at {2018,6,17} {21,48,41}
{application,sync,
             [{description,"Sync - Automatic Code Reloader"},
              {vsn,"0.1.3"},
              {id,[]},
              {modules,[sync,sync_notify,sync_options,sync_scanner,
                        sync_utils]},
              {registered,[]},
              {applications,[kernel,stdlib,syntax_tools,compiler]},
              {included_applications,[]},
              {env,[{discover_modules_interval,10000},
                    {discover_src_dirs_interval,10000},
                    {discover_src_files_interval,5000},
                    {compare_beams_interval,2000},
                    {compare_src_files_interval,1000},
                    {file_variables,"-*- mode: compilation; mode: auto-revert; buffer-read-only: true; auto-revert-interval: 0.5 -*-\n\n"},
                    {out_file,"/tmp/sync.out"},
                    {excluded_modules,[]}]},
              {maxT,infinity},
              {maxP,infinity},
              {mod,{sync,[]}}]}.

