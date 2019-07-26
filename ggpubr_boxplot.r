######################2019-07-26#########################
##create cutomized boxplot by ggpubr package#############
##explore the arguments of ggboxplot  ###################
#########################################################

library(ggpubr)

# Load data
#Use ‘data(package = .packages(all.available = TRUE))’
#to list the data sets in all *available* packages.
#or data() will list all the data in each packages

data("ToothGrowth")
df <- ToothGrowth

# Basic plot
# +++++++++++++++++++++++++++
# width: change box plots width, range 0 ~ 1
ggboxplot(df, x = "dose", y = "len", width = 0.2)

# Change orientation: horizontal
ggboxplot(df, "dose", "len", orientation = "horizontal")

# Notched box plot
ggboxplot(df, x = "dose", y = "len",
          notch = TRUE)

# Add dots
# ++++++++++++++++++++++++++
ggboxplot(df, x = "dose", y = "len",
          add = "dotplot")

# Add jitter points and change the shape by groups
ggboxplot(df, x = "dose", y = "len",
          add = "jitter", shape = "dose")


# Select and order items
# ++++++++++++++++++++++++++++++

# Select which items to display: "0.5" and "2"
ggboxplot(df, "dose", "len",
          select = c("0.5", "2"))

# Change the default order of items
ggboxplot(df, "dose", "len",
          order = c("2", "1", "0.5"))


# Change colors
# +++++++++++++++++++++++++++
# Change outline and fill colors
ggboxplot(df, "dose", "len",
          color = "black", fill = "gray")

# Change outline colors by groups: dose
# Use custom color palette
# Add jitter points and change the shape by groups
ggboxplot(df, "dose", "len",
          color = "dose", palette =c("#00AFBB", "#E7B800", "#FC4E07"),
          add = "jitter", shape = "dose")

# Change fill color by groups: dose
ggboxplot(df, "dose", "len",
          fill = "dose", palette = c("#00AFBB", "#E7B800", "#FC4E07"))


# Box plot with multiple groups
# +++++++++++++++++++++
# fill or color box plot by a second group : "supp"
my_comparisons <- list( c("0.5", "1"), c("1", "2"), c("0.5", "2") )
ggboxplot(df, "dose", "len", color = "supp",
          palette = c("#00AFBB", "#E7B800"),
          facet.by = "supp",
          panel.labs = list(supp = c("Organce Juice", "Vitamine C")),
#          short.panel.labs = FALSE,
          linetype = 1,  #solid line is 1
          size = 0.5,  #change point and box outline size
#          notch = TRUE, #default is FALSE,Notches are used to compare groups; if the notches of two boxes do not overlap, this suggests that the medians are significantly different.
          order = c("2", "1", "0.5"), #change order of items
          add = c("jitter","mean_sd"),
          add.params = list(color = "red"),
          xlab = "Dose (mg)",
          ylab = "Length (cm)",
          bxp.errorbar = TRUE,
          bxp.errorbar.width = 0.1, ##error bar line (horizontal) width
          label = paste0("bunny",1:nrow(df)),
          font.label = list(size = 8, face = "bold", color ="blue"),
#          label.select = list(top.up = 10, top.down = 4),
          label.select = list(criteria = "`y` > 20.9 | `y` < 7.2 & `x` %in% c('0.5', '1','2')"),
          repel=TRUE
#          label.rectangle=TRUE
) +
stat_compare_means(comparisons = my_comparisons,size = 3)+ # Add pairwise comparisons p-value
stat_compare_means(label.y = 50,size = 4)+     # Add global p-value


theme(axis.text.x = element_text(color = "grey20", size = 15, angle = 90, hjust = .5, vjust = .5, face = "plain"),
      axis.text.y = element_text(color = "grey20", size = 15, angle = 0, hjust = 1, vjust = 0, face = "plain"),  
      axis.title.x = element_text(color = "grey20", size = 20, angle = 0, hjust = .5, vjust = 0, face = "plain"),
      axis.title.y = element_text(color = "grey20", size = 20, angle = 90, hjust = .5, vjust = .5, face = "plain"))


# Paired samples
#:::::::::::::::::::::::::::::::::::::::::::::::::
ggpaired(ToothGrowth, x = "supp", y = "len",
         color = "supp", line.color = "gray", line.size = 0.4,
         palette = "npg")+
  stat_compare_means(paired = TRUE) 






stat_compare_means(mapping = NULL, data = NULL, method = NULL,
                   paired = FALSE, method.args = list(), ref.group = NULL,
                   comparisons = NULL, hide.ns = FALSE, label.sep = ", ",
                   label = NULL, label.x.npc = "left", label.y.npc = "top",
                   label.x = NULL, label.y = NULL, tip.length = 0.03,
                   bracket.size = 0.3, step.increase = 0, symnum.args = list(),
                   geom = "text", position = "identity", na.rm = FALSE,
                   show.legend = NA, inherit.aes = TRUE, ...)

