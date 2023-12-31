# 関数の読み込み
install.packages("tidyverse")
library(tidyverse)
install.packages("vegan")
library(vegan)

# データの読み込み
COI <- read_csv("data_raw/COICustom157bp/23111007_1COICustom157bp/4_相同性が高い生物種リスト(BLAST結果10位まで).csv")
trnL <- read_csv("data_raw/trnL-c_trnL-h-150bp/23111007_2trnL-c_trnL-h-150bp/4_相同性が高い生物種リスト(BLAST結果10位まで).csv")


# COI新松戸
COI_shinmatsudo <- select(COI, ASV_ID, Shinmats23_ZBJ, Accession_top1, Target_top1, Identity_top1, Species_top1)
COI_shinmatsudo %>%
  filter(Shinmats23_ZBJ > 100) %>% 
  count()

# COI千葉
COI_chiba <- select(COI, ASV_ID, Chiba23_ZBJ, Accession_top1, Target_top1, Identity_top1, Species_top1)
COI_chiba %>%
  filter(Chiba23_ZBJ > 100) %>% 
  count()

# COI津田沼
COI_tsudanuma <- select(COI, ASV_ID, Tsudanum23_ZBJ, Accession_top1, Target_top1, Identity_top1, Species_top1)
COI_tsudanuma %>%
  filter(Tsudanum23_ZBJ > 100) %>% 
  count()

# trnL新松戸
trnL_shinmatsudo <- select(trnL, ASV_ID, Shinmats23_trnL, Accession_top1, Target_top1, Identity_top1, Species_top1)
trnL_shinmatsudo %>%
  filter(Shinmats23_trnL > 100) %>% 
  count()

# trnL千葉
trnL_chiba <- select(trnL, ASV_ID, Chiba23_trnL, Accession_top1, Target_top1, Identity_top1, Species_top1)
trnL_chiba %>%
  filter(Chiba23_trnL > 100) %>% 
  count()

# trnL津田沼
trnL_tsudanuma <- select(trnL, ASV_ID, Tsudanum23_trnL, Accession_top1, Target_top1, Identity_top1, Species_top1)
trnL_tsudanuma %>%
  filter(Tsudanum23_trnL > 100) %>% 
  count()

# 各採取地ごとに検出されたASVのリード数分布(trnL)

# 津田沼
trnL %>%
  filter(Tsudanum23_trnL > 0) %>%   #新松戸あるいは千葉で検出されたが津田沼で検出されなかったサンプルを排除
  ggplot(aes(x = Tsudanum23_trnL)) +
  geom_histogram(binwidth = 100) # binの数はデフォルトで３０。いくつかの値を試してみる必要あり。
# bin幅が100刻みになるようにbinwidthで設定

# 新松戸
trnL %>%
  filter(Shinmats23_trnL > 0) %>%   #津田沼あるいは千葉で検出されたが新松戸で検出されなかったサンプルを排除
  ggplot(aes(x = Shinmats23_trnL)) +
  geom_histogram(binwidth = 100)

# 千葉
trnL %>%
  filter(Chiba23_trnL > 0) %>%   #新松戸あるいは津田沼で検出されたが千葉で検出されなかったサンプルを排除
  ggplot(aes(x = Chiba23_trnL)) +
  geom_histogram(binwidth = 100)
