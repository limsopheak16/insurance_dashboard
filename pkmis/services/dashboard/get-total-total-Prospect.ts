import prisma from "@/lib/prisma";

export async function getTotalProspect(): Promise<string> {
    const data = await prisma.$queryRaw<
      { total: string }[]>`
     SELECT COUNT(DISTINCT e.id)-
COUNT(DISTINCT i.employee_id) as total
  FROM employee e
  LEFT JOIN insured_coverage i ON i.employee_id=e.id`;
    console.log("------", data)
    if (data.length > 0) return data[0].total;
    else return "0";
  }