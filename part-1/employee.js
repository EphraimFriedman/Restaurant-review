var Employee = function(args) {
	this.firstName = args["firstName"] || ""
	this.sales = args["sales"] || []
}

Employee.prototype.totalSales = function() {
	var sum = 0
	for(i = 0; i < this.sales.length; i++){
		sum += this.sales[i]
	}
	return sum
}

Employee.prototype.averageSales = function() {
	return this.totalSales() / this.sales.length
}
