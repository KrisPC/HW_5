;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HW5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;1.29
(define merge
  (lambda(lst1 lst2)
    (cond
      ((null? lst1)lst2)
      ((null? lst2)lst1)
      (else
       (if(< (car lst1)(car lst2))
          (cons(car lst1)
               (merge (cdr lst1) lst2))
          (cons(car lst2)
               (merge lst1 (cdr lst2))))))))
(define doTheSplitting
  (lambda (lst0 lst1 Pos)
    (if(= Pos 0)
       (list (reverse lst0) lst1)
       (doTheSplitting
        (cons (car lst1) lst0)
        (cdr lst1)
        (- Pos 1)))))
(define cutInHalf
  (lambda (lst)
    (doTheSplitting '() lst (quotient (length lst) 2))))
(define mergeSort
  (lambda (lst)
    (cond
      ((null? lst) '())
      ((> (length lst) 1)
       (merge(mergeSort(car(cutInHalf lst)))
             (mergeSort(cadr (cutInHalf lst)))))
       (else lst))))
(mergeSort '(8 2 5 2 3))

;1.30
(define CoolMerSort
  (lambda (pred lst)
    (if(eq? pred <)
       (mergeSort lst)
       (reverse(mergeSort lst)))))
(CoolMerSort >'(8 2 5 2 3))
          
    