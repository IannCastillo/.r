library("plotrix")
library(animation)

color <- grDevices::colors()[grep('gr(a|e)y', grDevices::colors(), invert = T)]
### fractal plots ###
# x11(); par(pty="s") 
r0<-1 #initial radius
# plot(c(-r0,r0,-r0,r0),c(r0,r0,-r0,-r0),type="n",xlab = " ", ylab = " ", main = " ")
oopt = ani.options(interval = 0.5)

X<- seq(0,0,by=0.5) #initial center x-coor
Y<- seq(0,0,by=0.5) #initial center y-coor
alpha <- seq(2.5,2.5,by=0.5)
kmax<-20 #number of iterations
# X<- seq(1,3,length.out=5) #initial center x-coor
# Y<- seq(3,1,length.out=5) #initial center y-coor
# X<- seq(-0.75,0.75,by=(0.5-(1-1/sqrt(2))/4)) #initial center x-coor
# Y<- seq(-1,1,by=(0.5-(1-1/sqrt(2))/4)) #initial center y-coor
cy <- -1

#x11() # for histograms
#layout(matrix(seq(1,length(X)*length(Y)),length(Y), length(X), byrow=FALSE))

for (c0_x in X){
  #cy <- -sign(cy)
  for (c0_y in Y){
    #c0_y <- c0_y + cy*0.5/8
    for (a in alpha){
      show(c("alpha=",a))
      Xs<-vector("numeric")
      Ys<-vector("numeric")
      Rs<-vector("numeric")
      Ks<-vector("numeric")
      As<-vector("numeric")
      r<- r0   
      r2 <- r0
      ### fractal plots ###
      # draw.circle(c0_x,c0_y,r0,col="black")
      ###               ###
      for (k in 1:kmax){
        r <- c(r, (r0-r2[k]/sqrt(2))/2  )
        r2 <- c( r2, r0-a*r[(k+1)] )
        # case 1: 1
        # case 2: 2
        # case 3: (1/(2-sqrt(2)))
        # case 4: (2^3-(sqrt(2))^5)
        # case 5: (1+sqrt(2))
        dif_radius<- r0-r[k+1] # distance between generator generator center and generated center (for x and y coordinates)
        # center of new circles x and y coordinates
        center_x<-c(dif_radius,-dif_radius,-dif_radius,dif_radius)
        center_y<-c(dif_radius,dif_radius,-dif_radius,-dif_radius)
        ### fractal plots ### 
        # colour <- sample(color, 200)
        # draw.circle(c0_x,c0_y,r2[k+1],col=colour)
        # 
        # draw.circle(center_x[1],center_y[1],r[k+1],col=colour)
        # draw.circle(center_x[2],center_y[2],r[k+1],col=colour)
        # draw.circle(center_x[3],center_y[3],r[k+1],col=colour)
        # draw.circle(center_x[4],center_y[4],r[k+1],col=colour)
        # 
        # draw.circle(c0_x,c0_y,r2[k+1],col=colour)
        
        Xs<-c(Xs,c0_x,center_x)
        Ys<-c(Ys,c0_y,center_y)
        Rs<-c(Rs,r2[k+1],seq(r[k+1],r[k+1],length.out=4))
        Ks <-c(Ks,seq(k,k,length.out=5))
        As <-c(As,seq(a,a,length.out=5))
        ###               ###
        # abline(v=r2[k+1],lty=3,col=colour)
        # abline(h=r2[k+1],lty=3,col=colour)
        # abline(v=c(-r0,0,r0),lty=1,col="black")
        # abline(h=c(-r0,0,r0),lty=1,col="black")
        
        # ani.pause()  
      }
      # ani.options(oopt)
      output <- cbind(As,Xs,Ys,Rs,Ks) #results of an instance
      # write.csv(output,file=paste("case_alpha=",a,",k=",kmax,",r=",r0,",x=",c0_x,",y=",c0_y,".csv",sep=""))
    }
  }
}

size <- c(2,1,1,1,1)
for (k in 2:kmax){
  size <- cbind(size,size)
}
plot(Ks,Rs,type="b",cex=size)
