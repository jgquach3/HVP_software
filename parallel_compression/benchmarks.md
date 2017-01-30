#Parallel gzip and bzip2 benchmarks

##Sofware
gzip 1.3.12

bzip2 1.0.5

pigz 2.3.3 (parallel implementation of gzip)

lbzip2 2.5 (parallel implementation of bzip2)

##Hardware

Dual socket 12-core Intel E5-2680 v3 @ 2.50GHz (SDSC Comet supercomputer)

##Data set

Vanderbilt pre-pilot paired end reads (corresponds to 98,913,801 reads). 53 GB uncompressed

13389_S1_L002_R2_001.fastq

##Output

13389_S1_L002_R2_001.fastq

13389_S1_L002_R2_001.fastq.gz

13389_S1_L002_R2_001.fastq.bz2

##Results

* bzip2/lbzip give better compression than gzip/pigz (9.9 GB vs 14 GB)

* Serial version of gzip is faster than bzip2 for compression and decompression

* Parallel version of lbzip2 is faster than pigz for compression at all core counts

* Parallel version of lbzip2 is slower than unpigz at small core counts, but faster when using 8 or more cores

All timings are in seconds

|Cores  | pigz     | unpigz   | lbzip2   | lbunzip2 |
| ----- |:--------:|:--------:|:--------:|:--------:|
|  1    | 4417     |  291     | 3092     | 1281     |
|  2    | 2210     |  238     | 1548     |  696     |
|  3    | 1512     |  242     | 1045     |  477     |
|  4    | 1143     |  258     |  793     |  365     |
|  8    |  625     |  291     |  429     |  197     |
| 16    |  320     |  219     |  234     |  105     |
| 24    |  218     |  252     |  157     |  247     |