Kplot <- function(fname) {
	data <- read.fwf(fname, c(5, 5, 4))
	d <- data[ ,-2]
	tmp <- lsfit(d[ ,1], d[ ,2])
	tmp <- tmp$coef
	a <- tmp[1]
	b <- tmp[2]
	png("./K.png", width = 900, height = 450)
		plot(d, xlab = "year", ylab =" ", main = "K",
			pch = 19, cex = 1.5, cex.axis = 2, cex.main = 3, cex.lab = 1.5)
			abline(a,b)
	dev.off()

}