# multi-dev-sibernetic
This repo for multi devices sibernetic engine implementation. This implementation was testen on Novosibirsk State University cluster on configuration with several GPU unit from 1 to 8. GPU - NVIDIA Tesla V100. Results was reported [here](http://nusc.nsu.ru/wiki/lib/exe/fetch.php/reports/sskhayrulin/nsu_iis_sskhayrulin_202211.pdf) (in Russian), and [here](http://nusc.nsu.ru/wiki/lib/exe/fetch.php/reports/sskhayrulin/nsu_iis_sskhayrulin_202006.pdf) (in Russian) this old report.

# How to run

## Build
For building you have to run command `make -f makefile` it will create bin folder and create executable file
To clean all building arifacts you have to run command `make clean`

### Run options
```
Usage: ./bin/sibernetic [OPTION]
    --multi_dev                Run with all available devices.
                               but default it will run only one.
    -f <config_file>           Path to configuration file.
    -help, -h, -?, --help      Print this information.
    --p_sort turn on parallel sorting.
    -iter_limit=<number> limit for number of iteration simulation will preferme before stop.
    -time_limit=0.5 limit of time simulation in seconds (will run 0.5 seconds of simulation).
Full documentation at: <https://github.com/openworm/multi-dev-sibernetic/>
Please report any bugs/issues to: <https://github.com/openworm/multi-dev-sibernetic/issues>
```

# Algorithm
Add it soon
...

# Publication
Main algorithm idea was published [here](https://nccbulletin.ru/files/article/article-_5_bul_45_29_07_0.pdf)
