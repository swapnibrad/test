variable "res_1" {
  type = string
  default = "amol"
 }

variable "res_2" {
    type = number
    default = 56
}

variable  "res_3" {
    type = list
    default = ["amol","bablu","chuintu","guddu","munna"]
}     #          0       1        2       3          4

variable "res_4" {
    type = map
    default = {
        1 = "amol"
        2 = "bbbbbb"
        3 = "ccccccc"
    }
}

variable "sudhanshu" {
    type = any
    default = {
        r_1 = "amol"
        r_2 =  156
        r_3 = ["abx","def","ghi"]
        r_4 = {
                s_1 = "swapnil"
                s_2 = "siddhu"
                s_3 = ["saif","baimey"]
    }
}
}

variable "sudhanshu" {
    type = bool
    default = ["true","false"]
}