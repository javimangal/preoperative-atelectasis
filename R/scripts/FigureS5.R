# Figure S5 in the peer-reviewed manuscript and S4 in the preprint

### Table for barplot according to obesity class category:    
frequencies <- table(atelectasis_percent,class_obesity)
prop_figS5a <- prop.table(frequencies,margin=2)

### Visualize
barplot(prop_figS5a,beside=TRUE,ylim=c(0,1),ylab="Relative frequency",
        col=brewer.pal(8,"Blues"),
        legend.text=c("0%","2.5%","5%","7.5%","10%","12.5%","15%","≥17.5%"),
        space = c(0.2, 1.5)
)

# Figure S5b   

### Table for barplot according to obesity class 3 subgroups:    
frequencies <- table(atelectasis_percent,type_obesity)
prop_figS5b <- prop.table(frequencies,margin=2)

barplot(prop_figS5b,
        beside=TRUE,
        ylim=c(0,1),
        xlim=c(1,65),
        ylab="Relative frequency",
        col=brewer.pal(8,"Blues"),
        legend.text=c("0%","2.5%","5%","7.5%","10%","12.5%","15%","≥17.5%"),
        space = c(0.2, 1.5)
)


# FigureS5

### I only want to show frequencies for the subcategories of class 3 obesity.
prop_figS5b_sub <- prop_figS5b[1:8,3:5]

# Rebuild plot and stack them
png(filename=paste(figfolder,"/FigureS5.pdf",sep=""),width=8, height=5, units="in", res=1200)
layout(matrix(c(1,2), ncol=2), widths=c(5,5))
par(mgp=c(0,2,0))  
barplot(prop_figS5a,beside=TRUE,ylim=c(0,1),yaxt='n',
        main="A",adj=0,
        names.arg=expression(atop("30-35","Class 1"),atop("35-40","Class 2"),atop("≥40","Class 3")),
        col=brewer.pal(8,"Blues"),
        space = c(0.2, 1.5), 
        cex.axis = 0.9, cex.names = 0.9
)
axis(2, at=0.5, pos=0, labels="Relative frequency", las=0, tck=0, lwd=0)
axis(2, at=c(0.0,0.2,0.4,0.6,0.8,1.0), labels=FALSE)
axis(2, at=c(0.0,0.2,0.4,0.6,0.8,1.0), labels=c("0.0","0.2","0.4","0.6","0.8","1.0"), pos=3, tck=0, lwd=0, cex.axis=0.9)
par(mgp=c(2,0.5,0)) 
barplot(prop_figS5b_sub,beside=TRUE,ylim=c(0,1),
        main="B",adj=0,
        xlab="         Class 3 subgroups (kg/m²)", cex.lab = 0.9,
        col=brewer.pal(8,"Blues"),
        legend.text=c("0%","2.5%","5%","7.5%","10%","12.5%","15%","≥17.5%"),
        args.legend = c(y=1.1,cex=0.8),
        space = c(0.2, 1.5), 
        cex.axis = 0.9, cex.names = 0.9
)
dev.off()

png(filename=paste(figfolder,"/FigureS5.png",sep=""),width=8, height=5, units="in", res=1200)
layout(matrix(c(1,2), ncol=2), widths=c(5,5))
par(mgp=c(0,2,0))  
barplot(prop_figS5a,beside=TRUE,ylim=c(0,1),yaxt='n',
        main="A",adj=0,
        names.arg=expression(atop("30-35","Class 1"),atop("35-40","Class 2"),atop("≥40","Class 3")),
        col=brewer.pal(8,"Blues"),
        space = c(0.2, 1.5), 
        cex.axis = 0.9, cex.names = 0.9
)
axis(2, at=0.5, pos=0, labels="Relative frequency", las=0, tck=0, lwd=0)
axis(2, at=c(0.0,0.2,0.4,0.6,0.8,1.0), labels=FALSE)
axis(2, at=c(0.0,0.2,0.4,0.6,0.8,1.0), labels=c("0.0","0.2","0.4","0.6","0.8","1.0"), pos=3, tck=0, lwd=0, cex.axis=0.9)
par(mgp=c(2,0.5,0)) 
barplot(prop_figS5b_sub,beside=TRUE,ylim=c(0,1),
        main="B",adj=0,
        xlab="         Class 3 subgroups (kg/m²)", cex.lab = 0.9,
        col=brewer.pal(8,"Blues"),
        legend.text=c("0%","2.5%","5%","7.5%","10%","12.5%","15%","≥17.5%"),
        args.legend = c(y=1.1,cex=0.8),
        space = c(0.2, 1.5), 
        cex.axis = 0.9, cex.names = 0.9
)
FigureS5 <- recordPlot()
dev.off()