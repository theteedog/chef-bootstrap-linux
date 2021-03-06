#!/usr/bin/python
import sys, getopt, boto

def main(argv):
   bucketName = ''
   objectKey = ''
   try:
      opts, args = getopt.getopt(argv,"hb:k:",["bucketName=","objectKey:="])
   except getopt.GetoptError:
      print 'boto-s3-download.py -b <bucketName> -k <ObjectKey>'
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print 'boto-s3-download.py -b <bucketName> -k <ObjectKey>'
         sys.exit()
      elif opt in ("-b", "--BucketName"):
         bucketName = arg
      elif opt in ("-k", "--ObjectKey"):
         objectKey = arg
   print 'S3 Bucket Name is : ', bucketName
   print 'S3 Object Key  is : ',objectKey
   download(bucketName,objectKey)

def download(bucketName,s3ObjectKey):
  c = boto.connect_s3()
  b = c.get_bucket(bucketName) # substitute your bucket name here
  from boto.s3.key import Key
  k = Key(b)
  k.key = s3ObjectKey
  k.get_contents_to_filename('/tmp/private-bootstrap.zip')

if __name__ == "__main__":
   main(sys.argv[1:])
