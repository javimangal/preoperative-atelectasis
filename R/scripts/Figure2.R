# Figure 2a 

### Table for barplot according to obesity class category:    
frequencies <- table(atelectasis_percent,class_obesity)
prop_fig2a <- prop.table(frequencies,margin=2)

### Create and save 
png(filename=paste0(figfolder,"/Figure2a.png"),width=8, height=5, units="in", res=300)
barplot(prop_fig2a,beside=TRUE,ylim=c(0,1),ylab="Relative frequency",
        col=brewer.pal(9,"Blues"),
        legend.text=c("0%","2.5%","5%","7.5%","10%","12.5%","15%","17.5%","27.5%"),
        space = c(0.2, 1.5)
)
dev.off()


# Figure 2b   

### Table for barplot according to obesity class 3 subgroups:    
frequencies <- table(atelectasis_percent,type_obesity)
prop_fig2b <- prop.table(frequencies,margin=2)


png(filename=paste0(figfolder,"/Figure2b.png"),width=8, height=5, units="in", res=300)
barplot(prop_fig2b,
        beside=TRUE,
        ylim=c(0,1),
        xlim=c(1,65),
        ylab="Relative frequency",
        col=brewer.pal(9,"Blues"),
        legend.text=c("0%","2.5%","5%","7.5%","10%","12.5%","15%","17.5%","27.5%"),
        space = c(0.2, 1.5)
)
dev.off()


# Figure2



### I only want to show frequencies for the subcategories of class 3 obesity.
prop_fig2b_sub <- prop_fig2b[1:9,3:5]

# Rebuild plot and stack them
png(filename=paste(figfolder,"/Figure2.jpg",sep=""),width=8, height=5, units="in", res=300)
layout(matrix(c(1,2), ncol=2), widths=c(5,5))
par(mgp=c(0,2,0))  
barplot(prop_fig2a,beside=TRUE,ylim=c(0,1),yaxt='n',
        main="A",adj=0,
        names.arg=expression(atop("[30,35)","Class 1"),atop("[35,40)","Class 2"),atop("≥40","Class 3")),
        col=brewer.pal(9,"Blues"),
        space = c(0.2, 1.5), 
        cex.axis = 0.9, cex.names = 0.9
)
axis(2, at=0.5, pos=0, labels="Relative frequency", las=0, tck=0, lwd=0)
axis(2, at=c(0.0,0.2,0.4,0.6,0.8,1.0), labels=FALSE)
axis(2, at=c(0.0,0.2,0.4,0.6,0.8,1.0), labels=c("0.0","0.2","0.4","0.6","0.8","1.0"), pos=3, tck=0, lwd=0, cex.axis=0.9)
par(mgp=c(2,0.5,0)) 
barplot(prop_fig2b_sub,beside=TRUE,ylim=c(0,1),
        main="B",adj=0,
        xlab="         Class 3 subgroups (kg/m²)", cex.lab = 0.9,
        col=brewer.pal(9,"Blues"),
        legend.text=c("0%","2.5%","5%","7.5%","10%","12.5%","15%","17.5%","27.5%"),
        args.legend = c(y=1.1,cex=0.8),
        space = c(0.2, 1.5), 
        cex.axis = 0.9, cex.names = 0.9
)
dev.off()