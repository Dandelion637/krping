/*
 * lifted from fs/ncpfs/getopt.c
 */
#ifndef _KRPING_GETOPT_H
#define _KRPING_GETOPT_H

#define OPT_NOPARAM	1
#define OPT_INT		2
#define OPT_STRING	4
struct krping_option {
	const char *name;
	unsigned int has_arg;
	int val;
};

extern int krping_getopt(const char *caller, char **options, const struct krping_option *opts,
		      char **optopt, char **optarg, unsigned long *value);

/**
 * ib_alloc_mr() - Allocates a memory region
 * @param pd:            protection domain associated with the region
 * @param mr_type:       memory region type
 * @param max_num_sg:    maximum sg entries available for registration.
 *
 * Notes:
 * Memory registeration page/sg lists must not exceed max_num_sg.
 * For mr_type IB_MR_TYPE_MEM_REG, the total length cannot exceed
 * max_num_sg * used_page_size.
 *
 */
struct ib_mr *ib_alloc_mr(struct ib_pd *pd,
			  enum ib_mr_type mr_type,
			  u32 max_num_sg);
#endif /* _KRPING_GETOPT_H */
