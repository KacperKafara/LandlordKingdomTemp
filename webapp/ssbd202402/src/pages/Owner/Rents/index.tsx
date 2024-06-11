import DataField from "@/components/DataField";
import RefreshQueryButton from "@/components/RefreshQueryButton";
import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import { useGetOwnerCurrentRents } from "@/data/mol/useGetOwnerCurrentRents";
import { useBreadcrumbs } from "@/hooks/useBreadcrumbs";
import { t } from "i18next";
import { RefreshCw } from "lucide-react";
import { FC } from "react";
import { ChangeEndDate } from "./ChangeEndDate";
import { useNavigate } from "react-router-dom";
import { getAddressString } from "@/utils/address";

const RentsPage: FC = () => {
  const breadCrumbs = useBreadcrumbs([
    { title: t("currentOwnerRents.title"), path: "/owner" },
    { title: t("currentOwnerRents.rents"), path: "/owner/rents" },
  ]);
  const { data: rents, isLoading } = useGetOwnerCurrentRents();
  const navigate = useNavigate();
  if (isLoading) {
    return (
      <div className="flex justify-center">
        <div className="mt-10 h-full">
          <RefreshCw className="size-14 animate-spin" />
        </div>
      </div>
    );
  }

  if (!isLoading && rents?.length === 0) {
    return (
      <div className="relative w-full pt-2">
        {breadCrumbs}
        <div className="mt-5 flex flex-col items-center">
          <p className="text-xl">{t("currentOwnerRents.noRentsFound")}</p>
          <RefreshQueryButton
            className="absolute -right-9 top-1"
            queryKeys={["ownerCurrentRents"]}
          />
        </div>
      </div>
    );
  }

  return (
    <div className="relative pt-2">
      {breadCrumbs}
      <div className="flex w-full justify-center">
        <ul className="flex w-4/5 flex-wrap gap-2 py-4">
          {rents?.map((rent) => (
            <li key={rent.id} className="w-full min-w-[31rem] flex-1">
              <Card>
                <CardHeader>
                  <CardTitle>{rent.local.name}</CardTitle>
                  <CardDescription>
                    {getAddressString(rent.local.address)}
                  </CardDescription>
                </CardHeader>
                <CardContent className="grid grid-cols-2">
                  <DataField
                    label={t("currentOwnerRents.startDate")}
                    value={rent.startDate}
                  />
                  <DataField
                    label={t("currentOwnerRents.endDate")}
                    value={rent.endDate}
                  />
                  <DataField
                    label={t("currentOwnerRents.balance")}
                    value={rent.balance.toString() + " " + t("currency")}
                  />
                  <p className="col-span-2 my-3 text-xl font-bold">
                    {t("currentOwnerRents.tenant")}
                  </p>
                  <DataField
                    label={t("currentOwnerRents.name")}
                    value={rent.tenant.firstName + " " + rent.tenant.lastName}
                  />
                  <DataField
                    label={t("currentOwnerRents.email")}
                    value={rent.tenant.email}
                  />
                </CardContent>
                <CardFooter className="w-full justify-center gap-3">
                  <ChangeEndDate
                    startDate={rent.startDate}
                    id={rent.id}
                    endDate={rent.endDate}
                  />
                  <Button
                    className="flex-1"
                    onClick={() => navigate(`rent/${rent.id}`)}
                  >
                    {t("currentOwnerRents.rentDetails")}
                  </Button>
                  <Button className="flex-1">Action 3</Button>
                </CardFooter>
              </Card>
            </li>
          ))}
        </ul>
      </div>
      <RefreshQueryButton
        className="absolute -right-9 top-1"
        queryKeys={["ownerCurrentRents"]}
      />
    </div>
  );
};

export default RentsPage;
